
#include "tuning.h"
#include "math.h"
#include "device.h"
#include "driver_UART.h"

static uint8_t read_tuning_data[20] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
static uint8_t send_tuning_data[20] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

static int ESCid = 0;
static float T_Rph, T_PHIph, T_Lph;
static float T_Vflt, T_Iflt, T_Idcflt, T_Tflt;
static float T_ang_margine, T_zero_angle;
static int T_dirMR, T_dir_rot;

static float T_zero_angle_measured = 0;
static float n45 = 0, p45 = 0;
static float C_dirMR = 0;

static int T_desired_drive_mode, T_interface_type;
static float T_max_speed, T_Ispeed, T_Itorque, T_Tlimit;
static float T_throttle_off, T_throttle_zero, T_throttle_max;
static float T_kp_speed, T_ki_speed, T_kp_torque, T_ki_torque;

void send_measured_angle(float theta, float theta0, float theta1, int correct_dirMR)
{
    T_zero_angle_measured = theta;      //update the zero angle 
    p45 = theta0;   
    n45 = theta1;
    C_dirMR = correct_dirMR;            //update correct direction of MR
    send_currently_used_values(0x04);  
}

void tune_state_variables(float * Rph_adr, float * PHIph_adr, float * Lph_adr, float * Vflt_adr, float * Iflt_adr, float * Idcflt_adr, float * Tflt_adr, float * ang_margine_adr, float * zero_angle_adr, int * dirMR_adr, int * dir_rot_adr)
{
    volatile uint32_t temp32;
    
    volatile float tempf;
    volatile bool Eread_stat = 0;
    
    //==========================================================================
    //first update with currently used values
    
    T_Rph = *Rph_adr;
    T_PHIph = *PHIph_adr;
    T_Lph = *Lph_adr;
    
    T_Vflt = *Vflt_adr;
    T_Iflt = *Iflt_adr;
    T_Idcflt = *Idcflt_adr;
    T_Tflt = *Tflt_adr;
    
    T_ang_margine = *ang_margine_adr;
    T_zero_angle = *zero_angle_adr;   
    
    T_dirMR = *dirMR_adr;
    T_dir_rot = *dir_rot_adr;
    
    Eread_stat = Eread_stat;
    
    //====================================================================================
    //update values from EEPROM if ESCid> 0
    
    Eread_stat = EEPROM_WordRead(0x10, (uint32_t *)&temp32);
    __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
    
    ESCid =  tempf;
    
    if(ESCid > 0)
    {
     
        //1==========================================================================
        Eread_stat = EEPROM_WordRead(0x14, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_Rph = tempf/1000;
        
        Eread_stat = EEPROM_WordRead(0x18, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_PHIph = tempf/1000;
        
        Eread_stat = EEPROM_WordRead(0x1C, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_Lph = tempf/1000;
      
     
        //2==========================================================================
        Eread_stat = EEPROM_WordRead(0x20, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_Vflt = tempf;     
        
        Eread_stat = EEPROM_WordRead(0x24, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_Iflt = tempf;
        
        Eread_stat = EEPROM_WordRead(0x28, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_Idcflt = tempf;
        
        Eread_stat = EEPROM_WordRead(0x2C, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_Tflt = tempf;  
      
        //3==========================================================================
        Eread_stat = EEPROM_WordRead(0x34, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        if(tempf > 0) T_dir_rot = 1;
        else T_dir_rot = 0;
        
        Eread_stat = EEPROM_WordRead(0x38, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_zero_angle = tempf;
        
        Eread_stat = EEPROM_WordRead(0x3C, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        if(tempf > 0) T_dirMR = 1;
        else T_dirMR = 0; 
        
        //4==========================================================================
        Eread_stat = EEPROM_WordRead(0x40, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_ang_margine = tempf;    
        
    }
    
    //===============================================================================
    //Return tuning if ESCid > 0 from EEPROM otherwise as it is (default values)
    
    *Rph_adr = T_Rph;
    *PHIph_adr = T_PHIph;
    *Lph_adr = T_Lph;
    
    *Vflt_adr = T_Vflt;
    *Iflt_adr = T_Iflt;
    *Idcflt_adr = T_Idcflt;
    *Tflt_adr = T_Tflt;
    
    *ang_margine_adr = T_ang_margine;
    *zero_angle_adr = T_zero_angle;
    
    *dirMR_adr = T_dirMR;
    *dir_rot_adr = T_dir_rot;
}

void tune_drive_variables(int * desired_drive_mode_adr, float * max_speed_adr, float * Ispeed_adr, float * Itorque_adr, float * Tlimit_adr, float * throttle_off_adr, float * throttle_zero_adr, float * throttle_max_adr, int *interface_type_adr, float * kp_speed_adr, float * ki_speed_adr, float * kp_torque_adr, float * ki_torque_adr)
{
    volatile uint32_t temp32;
    volatile float tempf;
    volatile bool Eread_stat = 0;
    
    //==========================================================================
    //first update with currently used values
        
    T_desired_drive_mode = *desired_drive_mode_adr;
    
    T_max_speed = *max_speed_adr;
    T_Ispeed = *Ispeed_adr;
    T_Itorque = *Itorque_adr;
    T_Tlimit = *Tlimit_adr;
    
    T_throttle_off = *throttle_off_adr;
    T_throttle_zero = *throttle_zero_adr;
    T_throttle_max = *throttle_max_adr;
    T_interface_type = *interface_type_adr;
    
    T_kp_speed = *kp_speed_adr;
    T_ki_speed = *ki_speed_adr;
    T_kp_torque = *kp_torque_adr;
    T_ki_torque = *ki_torque_adr;
    
    
    
    //====================================================================================
    //update values from EEPROM if ESCid> 0
        
    Eread_stat = Eread_stat;
        
    if(ESCid > 0)
    {
        //3==========================================================================
        Eread_stat = EEPROM_WordRead(0x30, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_desired_drive_mode = (int)tempf;
        
        //6==========================================================================
        Eread_stat = EEPROM_WordRead(0x60, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_max_speed = tempf;        
        
        Eread_stat = EEPROM_WordRead(0x64, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_Ispeed = tempf;
        
        Eread_stat = EEPROM_WordRead(0x68, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_Itorque = tempf;
        
        Eread_stat = EEPROM_WordRead(0x6C, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_Tlimit = tempf; 
        
        //7==========================================================================
        Eread_stat = EEPROM_WordRead(0x70, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_throttle_off = tempf;        
        
        Eread_stat = EEPROM_WordRead(0x74, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_throttle_zero = tempf;
        
        Eread_stat = EEPROM_WordRead(0x78, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_throttle_max = tempf; 
        
        Eread_stat = EEPROM_WordRead(0x7C, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        if(tempf > 0) T_interface_type = 1;
        else T_interface_type = 0;
        
        //8==========================================================================
        /*Eread_stat = EEPROM_WordRead(0x80, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_kp_speed = tempf;        
        
        Eread_stat = EEPROM_WordRead(0x84, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_ki_speed = tempf;
        
        Eread_stat = EEPROM_WordRead(0x80, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_kp_torque = tempf;        
        
        Eread_stat = EEPROM_WordRead(0x84, (uint32_t *)&temp32);
        __builtin_memcpy((uint32_t *)&tempf, (uint32_t *)&temp32, 4);
        T_ki_torque = tempf;    */            
    }
    
    
    //===============================================================================
    //Return tuning if ESCid > 0 from EEPROM otherwise as it is (default values)
        
    *desired_drive_mode_adr = T_desired_drive_mode;
    
    *max_speed_adr = T_max_speed;
    *Ispeed_adr = T_Ispeed;
    *Itorque_adr = T_Itorque;
    *Tlimit_adr = T_Tlimit;
    
    *throttle_off_adr = T_throttle_off;
    *throttle_zero_adr = T_throttle_zero;
    *throttle_max_adr = T_throttle_max;
    *interface_type_adr = T_interface_type;
    
    *kp_speed_adr = T_kp_speed;
    *ki_speed_adr = T_ki_speed;
    *kp_torque_adr = T_kp_torque;
    *ki_torque_adr = T_ki_torque;    
}


void send_currently_used_values(uint8_t adr_HB)
{
    float tempf;
    
    //write address field
    
    send_tuning_data[0] = 0xFF;    
    send_tuning_data[1] = adr_HB;
    
    send_tuning_data[18] = 0xFF;
    send_tuning_data[19] = adr_HB;
    
    
    //write data based on address
    
    if(adr_HB == 01)
    {
        tempf = ESCid;    
        __builtin_memcpy((uint8_t *)(send_tuning_data + 2), &tempf, 4);

        tempf = T_Rph*1000;
        __builtin_memcpy((uint8_t *)(send_tuning_data + 6), &tempf, 4);

        tempf = T_PHIph*1000;
        __builtin_memcpy((uint8_t *)(send_tuning_data + 10), &tempf, 4);

        tempf = T_Lph*1000;        
        __builtin_memcpy((uint8_t *)(send_tuning_data + 14), &tempf, 4);        
    }
    
    else if(adr_HB == 02)
    {
        tempf = T_Vflt;    
        __builtin_memcpy((uint8_t *)(send_tuning_data + 2), &tempf, 4);

        tempf = T_Iflt;
        __builtin_memcpy((uint8_t *)(send_tuning_data + 6), &tempf, 4);

        tempf = T_Idcflt;
        __builtin_memcpy((uint8_t *)(send_tuning_data + 10), &tempf, 4);

        tempf = T_Tflt;        
        __builtin_memcpy((uint8_t *)(send_tuning_data + 14), &tempf, 4);
    }    

    
    else if(adr_HB == 03)
    {
        tempf = T_desired_drive_mode;
        __builtin_memcpy((uint8_t *)(send_tuning_data + 2), &tempf, 4);

        tempf = T_dir_rot;
        __builtin_memcpy((uint8_t *)(send_tuning_data + 6), &tempf, 4);

        tempf = T_zero_angle;
        __builtin_memcpy((uint8_t *)(send_tuning_data + 10), &tempf, 4);

        tempf = T_dirMR;      
        __builtin_memcpy((uint8_t *)(send_tuning_data + 14), &tempf, 4);
    } 
    
    else if(adr_HB == 04)
    {
        tempf = T_ang_margine;    
        __builtin_memcpy((uint8_t *)(send_tuning_data + 2), &tempf, 4);

        tempf = n45;
        __builtin_memcpy((uint8_t *)(send_tuning_data + 6), &tempf, 4);

        tempf = T_zero_angle_measured;
        __builtin_memcpy((uint8_t *)(send_tuning_data + 10), &tempf, 4);

        tempf = C_dirMR;      
        __builtin_memcpy((uint8_t *)(send_tuning_data + 14), &tempf, 4);
    }
    
    else if(adr_HB == 06)
    {
        tempf = T_max_speed;    
        __builtin_memcpy((uint8_t *)(send_tuning_data + 2), &tempf, 4);

        tempf = T_Ispeed;
        __builtin_memcpy((uint8_t *)(send_tuning_data + 6), &tempf, 4);

        tempf = T_Itorque;
        __builtin_memcpy((uint8_t *)(send_tuning_data + 10), &tempf, 4);

        tempf = T_Tlimit;    
        __builtin_memcpy((uint8_t *)(send_tuning_data + 14), &tempf, 4);
    }    
    
    
    else if(adr_HB == 07)
    {
        tempf = T_throttle_off;    
        __builtin_memcpy((uint8_t *)(send_tuning_data + 2), &tempf, 4);

        tempf = T_throttle_zero;   
        __builtin_memcpy((uint8_t *)(send_tuning_data + 6), &tempf, 4);

        tempf = T_throttle_max;   
        __builtin_memcpy((uint8_t *)(send_tuning_data + 10), &tempf, 4);

        tempf = T_interface_type;      
        __builtin_memcpy((uint8_t *)(send_tuning_data + 14), &tempf, 4);
    } 
    
    else if(adr_HB == 0x08)
    {
        tempf = T_kp_speed;    
        __builtin_memcpy((uint8_t *)(send_tuning_data + 2), &tempf, 4);

        tempf = T_ki_speed;   
        __builtin_memcpy((uint8_t *)(send_tuning_data + 6), &tempf, 4);

        tempf = T_kp_torque;   
        __builtin_memcpy((uint8_t *)(send_tuning_data + 10), &tempf, 4);

        tempf = T_ki_torque;      
        __builtin_memcpy((uint8_t *)(send_tuning_data + 14), &tempf, 4);
    } 
    
    else
    {
        send_tuning_data[18] = 0xF1;
    }
    
    send_data_uart(&send_tuning_data[0], 20);
}


void update_EEPROM_values(void)                 //Just store desired values in memory
{
    volatile uint32_t v1, v2, v3, v4;
    volatile uint32_t EEadr = 0;
    volatile bool Ewrite_stat = 0;
    
    Ewrite_stat = Ewrite_stat;
    
    EEadr = read_tuning_data[1];
    EEadr = EEadr << 4;                 //address is high byte as each adress should have 16 bytes for 4 floats

    __builtin_memcpy((uint8_t *)&v1, (uint8_t *)(read_tuning_data + 2), 4);
    Ewrite_stat = EEPROM_WordWrite(EEadr, v1);
    EEadr = EEadr + 0x04;
    
    EECONCLR = _EECON_WREN_MASK; 
    
    __builtin_memcpy((uint8_t *)&v2, (uint8_t *)(read_tuning_data + 6), 4);
    Ewrite_stat = EEPROM_WordWrite(EEadr, v2);
    EEadr = EEadr + 0x04;
    
    EECONCLR = _EECON_WREN_MASK; 
    
    __builtin_memcpy((uint8_t *)&v3, (uint8_t *)(read_tuning_data + 10), 4);
    Ewrite_stat = EEPROM_WordWrite(EEadr, v3);
    EEadr = EEadr + 0x04;
    
    EECONCLR = _EECON_WREN_MASK; 
    
    __builtin_memcpy((uint8_t *)&v4, (uint8_t *)(read_tuning_data + 14), 4);
    Ewrite_stat = EEPROM_WordWrite(EEadr, v4);

    EECONCLR = _EECON_WREN_MASK;                        // Turn off writes or read won't work
    
}

void tune_command(uint8_t * command_adr)                //decipher the tuning command
{
    __builtin_memcpy((uint8_t *)&read_tuning_data, (uint8_t *)command_adr, 20); //copy command
    if(*(read_tuning_data+18) == 0xff)
    {
        if(*(read_tuning_data+1) == *(read_tuning_data+19))
        update_EEPROM_values();     
        send_data_uart(&read_tuning_data[0], 20);            //acknowledgement
    }
    else
    {
        send_currently_used_values(*(read_tuning_data + 1));                    //currently used values
    }    
}


void fill_empty_EEPROM(void)
{
    
    volatile uint32_t v1, v2, v3, v4;
    volatile uint32_t EEadr = 0, temp32;
    bool Ewrite_stat = 0, Eread_stat = 0;
    float tempf;
    Eread_stat = Eread_stat;
    Eread_stat = EEPROM_WordRead(0x10, (uint32_t *)&temp32);
    if(temp32 == 0xFFFFFFFF)
    {
        Ewrite_stat = Ewrite_stat;

        //1======================================================================
        EEadr = 1;
        EEadr = EEadr << 4;                 //address is high byte as each adress should have 16 bytes for 4 floats

        tempf = -21;    //ESCid                      
        __builtin_memcpy((uint8_t *)&v1, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v1);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 

        tempf = 16;     //Rph
        __builtin_memcpy((uint8_t *)&v2, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v2);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 

        tempf = 6.8;     //PHIph
        __builtin_memcpy((uint8_t *)&v3, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v3);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 
        
        tempf = 0.018;     //Lph
        __builtin_memcpy((uint8_t *)&v4, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v4);
        EECONCLR = _EECON_WREN_MASK; 
        
        //2======================================================================
        EEadr = 2;
        EEadr = EEadr << 4;                 //address is high byte as each adress should have 16 bytes for 4 floats

        tempf = 60;    //Vflt                      
        __builtin_memcpy((uint8_t *)&v1, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v1);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 

        tempf = 450;     //Iflt
        __builtin_memcpy((uint8_t *)&v2, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v2);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 

        tempf = 450;     //Idcflt
        __builtin_memcpy((uint8_t *)&v3, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v3);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 
        
        tempf = 100;     //Tflt
        __builtin_memcpy((uint8_t *)&v4, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v4);
        EECONCLR = _EECON_WREN_MASK;  
        
        //3======================================================================
        EEadr = 3;
        EEadr = EEadr << 4;                 //address is high byte as each adress should have 16 bytes for 4 floats

        tempf = 1;    //drive mode                     
        __builtin_memcpy((uint8_t *)&v1, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v1);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 

        tempf = 0;     //dir_rot
        __builtin_memcpy((uint8_t *)&v2, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v2);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 

        tempf = 310;     //zero_angle
        __builtin_memcpy((uint8_t *)&v3, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v3);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 
        
        tempf = 0;    //sensor orientation
        __builtin_memcpy((uint8_t *)&v4, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v4);
        EECONCLR = _EECON_WREN_MASK; 
        
        //4======================================================================
        EEadr = 4;
        EEadr = EEadr << 4;                 //address is high byte as each adress should have 16 bytes for 4 floats

        tempf = 35;    //angle_margin                     
        __builtin_memcpy((uint8_t *)&v1, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v1);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 

        tempf = 0;     //
        __builtin_memcpy((uint8_t *)&v2, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v2);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 

        tempf = 310;     //zero_angle
        __builtin_memcpy((uint8_t *)&v3, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v3);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 
        
        tempf = 0;     //sensor orientation
        __builtin_memcpy((uint8_t *)&v4, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v4);
        EECONCLR = _EECON_WREN_MASK; 
        
        
        //6======================================================================
        EEadr = 6;
        EEadr = EEadr << 4;                 //address is high byte as each adress should have 16 bytes for 4 floats

        tempf = 7000;    //max_speed                     
        __builtin_memcpy((uint8_t *)&v1, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v1);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 

        tempf = 200;     //I_speed
        __builtin_memcpy((uint8_t *)&v2, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v2);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 

        tempf = 400;     //I_torque
        __builtin_memcpy((uint8_t *)&v3, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v3);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 
        
        tempf = 80;     //Tlimit
        __builtin_memcpy((uint8_t *)&v4, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v4);
        EECONCLR = _EECON_WREN_MASK; 
        
                
        //7======================================================================
        EEadr = 7;
        EEadr = EEadr << 4;                 //address is high byte as each adress should have 16 bytes for 4 floats

        tempf = 0.9;    //throttle_max                     
        __builtin_memcpy((uint8_t *)&v1, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v1);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 

        tempf = 1;     //throttle_zero
        __builtin_memcpy((uint8_t *)&v2, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v2);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 

        tempf = 4;     //throttle_max
        __builtin_memcpy((uint8_t *)&v3, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v3);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 
        
        tempf = 0;     //Input_type
        __builtin_memcpy((uint8_t *)&v4, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v4);
        EECONCLR = _EECON_WREN_MASK; 
        
        //8======================================================================
        EEadr = 8;
        EEadr = EEadr << 4;                 //address is high byte as each adress should have 16 bytes for 4 floats

        tempf = 0.005;    //speed_kp                     
        __builtin_memcpy((uint8_t *)&v1, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v1);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 

        tempf = 0.02;     //speed_ki
        __builtin_memcpy((uint8_t *)&v2, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v2);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 

        tempf = 5;     //torque_kp
        __builtin_memcpy((uint8_t *)&v3, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v3);
        EEadr = EEadr + 0x04;
        EECONCLR = _EECON_WREN_MASK; 
        
        tempf = 100;     //torque_ki
        __builtin_memcpy((uint8_t *)&v4, &tempf, 4);
        Ewrite_stat = EEPROM_WordWrite(EEadr, v4);
        EECONCLR = _EECON_WREN_MASK;  
    }
            
}