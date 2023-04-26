#include "driver_ADC.h"	
#include "driver_PWM.h"
#include "state_engine.h"
#include "fault.h"
#include "device.h"
#include "math.h"
#include "driver_GPIO.h"
#include "application_software.h"
#include "tuning.h"
#include "driver_UART.h"
#include "diagnostics.h"
#include "driver_SPI.h"

    #define SLOW_ROUTINE_COUNT 5

    #define FAULT 0
	#define CALIBERATION 1
	#define STOP 2
	#define PMSM 3
    #define ROTOR_HOLD 4

    #define OFF 0
    #define SPEED_CONTROL 1
    #define TORQUE_CONTROL 2
    #define IREF_CONTROL 3
    #define ROTOR_POS_ID 4

//non tunable parameters========================================================

    #define KP_SLESS_CON 100.0
    #define KI_SLESS_CON 2000.0

    #define DW_SLESS_SAT 2000.0

    #define KP_ICON 0.0005
    #define KI_ICON 0.2
    #define DQ_DUTY_SAT 1.3

//Default values of tunable parameters==========================================

    #define RPH 0.006
    #define PHIPH 0.0068
    #define LPH 0.000012

    #define VFLT 62.0
    #define IFLT 500.0
    #define IDCFLT 400.0
    #define TFLT 110.0

    #define ANG_MARGINE 20.0  
    #define ZERO_ANGLE 255  //(BK2.2 CW: 255, 0)  //BK2.1 CW: 310, 0)
    #define DIRMR 0         //(BK2.2 CW: 290, 1)  //BK2.1 CCW:)
    #define DIR_ROT 0       //Looking from shaft RYB starts from right terminal
                            //reverse rule: 180 - zero_angle
//==============================================================================

    //#define CAL_TIME LATBbits.LATB6   

    //#define ANG_CAL_EN 0
    //#define ROTATION 0         //1  //0
    //#define SENSOR_REVERSE 0   //1  //0

//state variables===============================================================
	static int system_state = CALIBERATION;
	static int fault_id = 0;
	static int slow_routine_counter = 0;

//motor variables===============================================================	
	static float Vdc = 0, Idc = 0;
	static float Iu = 0, Iv = 0, Iw = 0; 
	static float cosMR, sinMR;
    static int dir_rot = 0, dirMR = 0;
    static float zero_angle = 310;
	static float MRcos0, MRsin0;
    static float wMR = 0;	
	
    static float Tu = 0, Tv = 0, Tw = 0, Tdc = 0, Tm = 0, Tesc = 0;
    static float Rph = 0.002, Lph = 0.000018, PHIph = 0.0068; 
    
//control variables=============================================================	    
	static float dt = 0.00004;
    static float du = 0, dv = 0, dw =0;
    static float Vflt = 80.0, Idcflt = 400.0, Iflt = 500.0, Tflt = 110.0;
    
    static float kp_sless_con = 20.0, ki_sless_con = 200.0;
    static float dw_sless_sat = 2000;
    static float ang_margine = 30.0;
    static float kp_icon = 0.0005, ki_icon = 0.2;
    static float dq_duty_sat = 1.3;
    
    static float Throttle = 0;	
	static float Idref = 5.0, Iqref = 0;
    static int drive_state = 0;
    
    static float RPM = 0, Torq = 0, Idc_f = 0;
    
    
//Functions=====================================================================    
    
void state_init(void)  //To be called first in main()
{
    
    turn_on_LED();
       
    
    system_state = CALIBERATION;
    drive_state = 0;
    
    PWM_init(&dt);
    
    kp_sless_con = KP_SLESS_CON;
    ki_sless_con = KI_SLESS_CON;
    dw_sless_sat = DW_SLESS_SAT;
    
    kp_icon = KP_ICON;
    ki_icon = KI_ICON;
    dq_duty_sat = DQ_DUTY_SAT;   

 
//Default values of tunable parameters==========================================
    Vflt = VFLT;
    Iflt = IFLT;
    Idcflt = IDCFLT;
    Tflt = TFLT;  
           
    Rph = RPH;
    PHIph = PHIPH;
    Lph = LPH;    
    
    ang_margine = ANG_MARGINE;
    zero_angle = ZERO_ANGLE;   
    
    dirMR = DIRMR;  
    dir_rot = DIR_ROT;
    
//==============================================================================    
    //ask for id
    //if id> 0 call tuning functions to replace above variables
    tune_state_variables(&Rph, &PHIph, &Lph, &Vflt, &Iflt, &Idcflt, &Tflt, &ang_margine, &zero_angle, &dirMR, &dir_rot); 
    
    if(dir_rot == 1)    //for reversing the direction of rotation
    {
        zero_angle = 180 - zero_angle;
        if(dirMR == 1) dirMR = 0;
        else dirMR = 1;
    }
    
    MRcos0 = cos(zero_angle * 3.14159265/180);
    MRsin0 = sin(zero_angle * 3.14159265/180);  
    
    drive_init(Tflt);    
}
	

void fast_routines(void)
{
	static int caliberation_counter = 0;
	
	//CAL_TIME = 1;
    
    fault_id = 3;           //LED blink times
    
	slow_routine_counter++;
	       
	fast_measurement_VI(&Vdc, &Idc, &Iu, &Iv, &Iw);
	fast_measurement_RP(&cosMR, &sinMR, dirMR);

	if(fault_id != 0) system_state = FAULT;
	else fault_id = fast_fault_check();	
    
	switch(system_state)
	{
		case CALIBERATION:		          
            PWM_override_OFF();     //keep phases off
            ADC_calib();            // caliberate current sensors
            caliberation_counter++;
            if(caliberation_counter >= 10000)
            {
                caliberation_counter = 0;
                system_state = STOP;
            }			
		break;
		
		case STOP:		
            turn_on_LED();          
            PWM_override_OFF();        
		break;
		
		case PMSM:		            
            duty_cal_update(du, dv, dw);
		break;
        
        case ROTOR_HOLD: 
            measurement_constants_update(0.816496610641479, 0, Vflt, Idcflt, Iflt, Tflt);
            duty_cal_update(du, dv, dw);            
        break;        
		
		case FAULT:		
            fault(fault_id);            
		break;
		
		default:            
            system_state = FAULT;
			fault_id = 9;
		break;	
	}    
    //CAL_TIME = 0;
}

void slow_routines(void)
{
	if(slow_routine_counter >= 5) 
	{
        static float stime = 0;
        //CAL_TIME = 1;
		slow_routine_counter = 0;
        
		slow_measurement_T(&Tu, &Tv, &Tw, &Tdc, &Tm);
        //slow_measurement_MT(&Tm);
        
		slow_measurement_input((dt*5), &wMR, &Throttle);		
		if(fault_id == 0) fault_id = slow_fault_check();
        
        drive_state = drive_condition(Vdc, Throttle);
        
        torque_speed_calculation(Vdc, Idc, wMR, &RPM, &Torq, &Idc_f);   
        Tesc = (Tu+Tv+Tw)/3.0;
        
        stime = stime + dt*5;
        
        Vdc = 40*sin(2*3.14*.1*stime);
        Idc_f = 20*cos(2*3.14*.1*stime);
               
        
        fill_diag_data(system_state, Vdc, Idc_f, RPM, Torq, Tu, Tm);
        send_byte_uart();
        recieve_command_uart();
        
        
        		
		switch(system_state)
	    {	
			case CALIBERATION:
				
			break;
			
			case STOP:			
                measurement_constants_update(MRcos0, MRsin0, Vflt, Idcflt, Iflt, Tflt);         //update parameters
                drive_reset(&Idref, &Iqref); //reset current integrators

                if(drive_state > 0)
                {
                    if(drive_state == ROTOR_POS_ID) system_state = ROTOR_HOLD;
                    else system_state = PMSM;
                    
                    PWMpins_enable();
                    turn_off_LED();
                }
			break;
			
			case PMSM:                          
                if(drive_state == SPEED_CONTROL) speed_control(Throttle, dt*5);
                else if (drive_state == TORQUE_CONTROL) torque_control(Throttle, dt*5);
                else if (drive_state == IREF_CONTROL) current_ref_control(Throttle);
                else system_state = STOP;
                
                current_ref_generator(&Idref, &Iqref, Tesc, Tm);                
			break;
			
			case FAULT:
			
			break;
            
            case ROTOR_HOLD:
                if(drive_condition(Vdc, Throttle) == OFF) system_state = STOP;
                current_ref_generator(&Idref, &Iqref, 50, 50);
                angle_finder(cosMR, sinMR, dirMR);
            break;
                        		
			default:
                
			break;	            
		}	        
        //CAL_TIME = 0;
	}
}

