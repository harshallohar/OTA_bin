#include "application_software.h"
#include "fastmath.h"
#include "tuning.h"

#define OFF 0
#define SPEED_CONTROL 1
#define TORQUE_CONTROL 2
#define IREF_CONTROL 3
#define ROTOR_POS_ID 4
#define DESIRED_DRIVE_MODE 1

#define NOT_READY 0
#define READY 1
#define READY_AND_ON 3

#define VON 35
#define VLOW 30

#define SAFE_SPEED 200               //for turn/turnoff

#define COSN45 0.707106781
#define SINN45 0.707106781

#define MAX_SPEED 7000
#define I_SPEED 220
#define I_TORQUE 400
#define TLIMIT 90

#define IQ_LIMIT 100

#define INTERFACE_TYPE 0
#define THROTTLE_OFF 0.9
#define THROTTLE_ZERO 1.0
#define THROTTLE_MAX 4.0

#define KP_SPEED 0.1
#define KI_SPEED 0.2

#define KP_TORQUE 5.0
#define KI_TORQUE 100.0

static float Id_desired = 0, Iq_desired = 0;
static float speed = 0, torque = 0, abs_speed;
static float Id_desired_integrator = 0;

static int desired_drive_mode = IREF_CONTROL;
static int interface_type = 0;

static float max_speed = 7000, Ispeed = 200, Itorque = 400, Tlimit = 100;
static float abs_max_speed = 7000;
static float throttle_off = 0.9, throttle_zero = 1.0, throttle_max = 4.0; 
static float kp_speed = 0.1, ki_speed = 0.2;
static float kp_torque = 5.0, ki_torque = 100.0;

static float Itorque_speed = 1000, cp_speed_range = 1000;
static float temperature_margine = 20;

void drive_init(float Tflt)
{   
    desired_drive_mode = DESIRED_DRIVE_MODE;            //speed or torque control  
    
    max_speed = MAX_SPEED;
    Ispeed = I_SPEED;
    Itorque = I_TORQUE;
    Tlimit = TLIMIT;
    
    throttle_off = THROTTLE_OFF;
    throttle_zero = THROTTLE_ZERO;
    throttle_max = THROTTLE_MAX;
    interface_type = INTERFACE_TYPE;
        
    kp_speed = KP_SPEED;
    ki_speed = KI_SPEED;
    
    kp_torque = KP_TORQUE;
    ki_torque = KI_TORQUE;
    
    tune_drive_variables(&desired_drive_mode, &max_speed, &Ispeed, &Itorque, &Tlimit, &throttle_off, &throttle_zero, &throttle_max, &interface_type, &kp_speed, &ki_speed, &kp_torque, &ki_torque);
   
       
    if(max_speed > 7500) max_speed = 7500;
    if(max_speed < -7500) max_speed = -7500;
    
    if(max_speed < 0) abs_max_speed = -max_speed;
    else abs_max_speed = max_speed;
    
    if(Ispeed > 230) Ispeed = 230;
    if(Ispeed < 10) Ispeed = 10;
    
    if(Itorque > 500) Itorque = 500;
    if(Itorque < 10) Itorque = 10;
    
    if(Ispeed > Itorque) Ispeed = Itorque;
        
    Itorque_speed = abs_max_speed*Ispeed/Itorque;    
    
    cp_speed_range = abs_max_speed - Itorque_speed;
    if(cp_speed_range < 1) cp_speed_range = 1;
    
    if((Tflt - Tlimit) < 10) Tlimit = Tflt - 10;
    temperature_margine = Tflt - Tlimit;
    
    if(throttle_max > 5) throttle_max = 5;
    if(throttle_max < 2.5) throttle_max = 2.5;
    
    if(throttle_zero > 2) throttle_zero = 2;
    if(throttle_zero < 0.2) throttle_zero = 0.2;
    
    if(throttle_off < 0.1) throttle_off = 0.1;
    if((throttle_zero - throttle_off)< 0.1 )throttle_off = throttle_zero - 0.1;    
    
}

void drive_reset(float * adr_Idref, float * adr_Iqref)
{    
    *adr_Iqref = 0;
    *adr_Idref = 0;
    
    Id_desired = 0;
    Iq_desired = 0;
    
    Id_desired_integrator = 0;      //reset speed control and torque control integration
}

void torque_speed_calculation(float Vdc, float Idc, float w, float * RPM_adr, float * Torq_adr, float * Idc_f_adr )
{
    float itorque = 0;
    static float fIdc = 0;
    
    speed = w * 1.90986;
    
    if(speed < 0) abs_speed = -speed;
    else abs_speed = speed; 
    
    
    *RPM_adr = speed;
    
    fIdc = fIdc + 0.01*(Idc - fIdc);
    *Idc_f_adr = fIdc;
    
       
    if((speed > 100) | (speed < - 100))
    {
        itorque = (Vdc*Idc/speed*60/2/3.1416 - 0.4 + 0.00002*speed); //based on inputput power
    }
    else 
    {
        itorque = Id_desired * 0.03;    //low speed estimate
    }
    
    torque = torque + 0.01*(itorque - torque);
    
    *Torq_adr = torque;
}

int drive_condition(float Vdc, float Throttle)
{    
    static int current_drive_state = 0;
    static int stop_wait_counter = 0;
    
    if(desired_drive_mode > 4) desired_drive_mode = 3; //default mode Iref_control
    if(desired_drive_mode < 0) desired_drive_mode = 3;
    
    if(current_drive_state == OFF)    
    {
        stop_wait_counter++;    
    
        if(stop_wait_counter > 2000)
        {                    
            stop_wait_counter = 0;
            if(Vdc > VON)                                   //Ok voltage
            {        
                if(desired_drive_mode > 0)
                {
                    if((speed < SAFE_SPEED) & (speed > -SAFE_SPEED)) //safe speed to turn on or off
                    {
                        stop_wait_counter = 2000;
                        if(Throttle >= throttle_zero) 
                        {   
                            current_drive_state = desired_drive_mode;
                        }   
                        stop_wait_counter = 0;
                    }
                }
            }            
        }         
    }    
    else
    {
        if(Vdc < VLOW) current_drive_state = OFF; 
        if((speed < SAFE_SPEED) & (speed > -SAFE_SPEED))
        {
            if(Throttle <= throttle_off) current_drive_state = OFF;
        }
    }
    return current_drive_state;
}


void current_ref_generator(float * adr_Idref, float * adr_Iqref, float Tesc, float Tm)  //slow down current change and limits
{
    float Id_limit;
    float Itorque_temp;
    float derate_coeff_esc = 1;
    float derate_coeff_motor = 1;    

    //constant power calculation
    if(abs_speed < Itorque_speed)   Id_limit = Itorque;
    else
    {
        Id_limit = Ispeed + (Itorque - Ispeed)*(abs_max_speed - abs_speed)/(cp_speed_range) ;
    }
    
    //Temperature derating
    Tm = 30;
    if(Tm > 130)
    {
        derate_coeff_motor = 1 - 0.7*(Tm - 130)/30.0;
    }
    else derate_coeff_motor = 1;
    
    if(Tesc > Tlimit)
    {
        derate_coeff_esc = 1 - 0.7*(Tesc - Tlimit)/temperature_margine;
    }
    else  derate_coeff_esc = 1;
   
    Itorque_temp = derate_coeff_motor * derate_coeff_esc * Itorque;
    
    if(Id_limit > Itorque_temp) Id_limit = Itorque_temp;
    
    
    //above maximum speed
    if(abs_speed > abs_max_speed)
    {
        Id_limit = (1 - (abs_speed - abs_max_speed)/(8000 - abs_max_speed)) * Id_limit;
    }    
    if(Id_limit < 10) Id_limit = 10;
    
    
        
    if(*adr_Idref < Id_desired) *adr_Idref = *adr_Idref + 0.05;
    else if (*adr_Idref > Id_desired ) *adr_Idref = *adr_Idref - 0.05;

    if(*adr_Idref < -Id_limit ) *adr_Idref = -Id_limit;
    if(*adr_Idref > Id_limit) *adr_Idref = Id_limit;
    
    if(*adr_Iqref < Iq_desired) *adr_Iqref = *adr_Iqref + 0.05;
    else if (*adr_Iqref > Iq_desired ) *adr_Iqref = *adr_Iqref - 0.05;

    if(*adr_Iqref < -IQ_LIMIT ) *adr_Iqref = -IQ_LIMIT;
    if(*adr_Iqref > IQ_LIMIT) *adr_Iqref = IQ_LIMIT;    
}

void current_ref_control(float Throttle)
{
    Iq_desired = 0;
    
    Id_desired = 2.0 + (Throttle  - throttle_zero)/(throttle_max - throttle_zero)*Itorque;
    
    if(abs_speed > Itorque_speed)
    {
        Id_desired = Id_desired * Ispeed/Itorque*abs_max_speed/abs_speed;
    }    
    
    if(Id_desired < 2.0) Id_desired = 2.0;
    if(Id_desired > 400.0) Id_desired = 400.0;
}

void speed_control(float Throttle, float dt)
{
    float speed_ref = 0;
    static float speed_ref_descreet = 0;
    float speed_err = 0;
    
    speed_ref = 500 + (Throttle - throttle_zero)/(throttle_max-throttle_zero)* MAX_SPEED;
    if(speed_ref < 500) speed_ref_descreet = speed_ref;
    if(speed_ref > 500 && speed_ref < 1200) speed_ref_descreet = 1000;
    if(speed_ref >= 1500 && speed_ref < 2200) speed_ref_descreet = 2000;
    if(speed_ref >= 2500 && speed_ref < 3200) speed_ref_descreet = 3000;
    if(speed_ref >= 3500 && speed_ref < 4200) speed_ref_descreet = 4000;    
    if(speed_ref >= 4500 && speed_ref < 5200) speed_ref_descreet = 5000;    
    if(speed_ref >= 5500 && speed_ref < 6200) speed_ref_descreet = 6000;    
    if(speed_ref >= 6500 && speed_ref < 7200) speed_ref_descreet = 7000;
    
    if(MAX_SPEED > 0)
    {if(speed_ref > MAX_SPEED) speed_ref = MAX_SPEED;    }
    if(MAX_SPEED < 0)
    {if(speed_ref < MAX_SPEED) speed_ref = MAX_SPEED;    }
    
    speed_err = speed_ref_descreet - speed;
    
    Id_desired_integrator = Id_desired_integrator + speed_err * ki_speed * dt;
    
    if(Id_desired_integrator > 20) Id_desired_integrator = 20;
    if(Id_desired_integrator < 5) Id_desired_integrator = 5;
    
    Id_desired = Id_desired_integrator + speed_err * kp_speed;
    
    if(Id_desired > 20) Id_desired = 20;
    if(Id_desired < 2) Id_desired = 2;    
    
    Iq_desired = 0;
    
}

void torque_control(float Throttle, float dt)
{
    float torque_ref = 0; 
    float torque_err = 0;
    
    #define ILIMIT_TC_P 400 
    #define ILIMIT_TC_N 3
    #define TORQUE_MAX 19
        
    torque_ref = (Throttle - throttle_zero)/(throttle_max - throttle_zero)* TORQUE_MAX;
    if(torque_ref > TORQUE_MAX) torque_ref = TORQUE_MAX;
    torque_err = torque_ref - torque;
    
    Id_desired_integrator = Id_desired_integrator + torque_err * ki_torque * dt;
    
    if(Id_desired_integrator > ILIMIT_TC_P) Id_desired_integrator = ILIMIT_TC_P;
    if(Id_desired_integrator < ILIMIT_TC_N) Id_desired_integrator = ILIMIT_TC_N;
    
    Id_desired = Id_desired_integrator + torque_err * kp_torque;
    
    if(Id_desired > ILIMIT_TC_P) Id_desired = ILIMIT_TC_P;
    if(Id_desired < ILIMIT_TC_N) Id_desired = ILIMIT_TC_N;    
    
    Iq_desired = 0;
}

void angle_finder(float Scos, float Ssin, int current_dirMR)
{
    static int angle_finder_step = 0;
    static int hold_time_counter = 0;
    float Zcos, Zsin;
    static float theta, theta0, theta1, theta_diff;
    static int correct_dirMR;
    hold_time_counter++;
    
    switch(angle_finder_step)
    {
        case 0:            
            Id_desired = 15;
            Iq_desired = 15;
        
            if(hold_time_counter >= 10000)
            {
                hold_time_counter = 0;
                angle_finder_step = 1;
                
                Zcos = Scos/0.816496610641479;
                Zsin = Ssin/0.816496610641479;
                theta0 = find_ang(Zcos, Zsin);                                
            }            
        break;
        
        case 1:            
            Id_desired = 15;
            Iq_desired = -15;
        
            if(hold_time_counter >= 10000)
            {
                hold_time_counter = 0;
                angle_finder_step = 2;
                
                Zcos = Scos/0.816496610641479;
                Zsin = Ssin/0.816496610641479;
                theta1 = find_ang(Zcos, Zsin);
            }            
        break; 
        
        case 2: 
            Id_desired = 15;
            Iq_desired = 15;
        
            if(hold_time_counter >= 10000)
            {   
                hold_time_counter = 0;
                angle_finder_step = 0; 
                
                theta_diff = theta0 - theta1;
                if(theta_diff > 180) theta_diff = theta_diff - 360;
                if(theta_diff < -180) theta_diff = theta_diff + 360;
                
                Zcos = Scos /0.816496610641479;
                if((theta_diff) < 0)  
                {
                    Zsin = -Ssin /0.816496610641479;
                    if(current_dirMR == 0) correct_dirMR = 1;
                    else correct_dirMR = 0;
                }
                else
                {
                    Zsin = Ssin /0.816496610641479;
                    correct_dirMR = current_dirMR;
                }
                theta = find_ang(Zcos, Zsin);
                
                send_measured_angle(theta, theta0, theta1, correct_dirMR);                
            }            
        break;    
            
        default:
            hold_time_counter = 0;
            angle_finder_step = 0; 
        break; 
    }
}


