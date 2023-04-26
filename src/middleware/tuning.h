
#ifndef _TUNING_H    /* Guard against multiple inclusion */
#define _TUNING_H

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes


#ifdef __cplusplus
extern "C" {
#endif
    
    
    void update_EEPROM_values(void);        //updates specific locations of EEPROM
                                            //location address and data is available in read_tuning data array
        
    void send_currently_used_values(uint8_t);   //prepares send_tuning_data array to be sent over UART
    //unit8t EEPROM_Address_corresponding_to_values_to_be_seen
    
    void tune_command(uint8_t *);           //decode the command received
    //address of command array coming from UART driver
    
    void tune_state_variables(float *, float *, float *, float *, float *, float *, float *, float *, float *, int *, int *);
    //*Rph, *PHIph, *Lph, *Vflt, *Iflt, *Idcflt, *Tflt, *ang_margine, *zero_angle, *dirMR, *dir_rot
    
    void tune_drive_variables(int *, float *, float *, float *, float *, float *, float *, float *, int *, float *, float *, float *, float *);
    //desired_drive_mode, max_speed, I_speed, I_torque, Tlimit, throttle_off, throttle_zero, throttle_max, interface_type, speed_kp, speed_ki, torque_kp, torque_ki
    
    void send_measured_angle(float, float, float, int); //special function to send detected angles after rotor position caliberation
    //Theta at 45, theta at 135, corrected theta at 45, corrected MR orientation
    
    void fill_empty_EEPROM(void);
    

#ifdef __cplusplus
}
#endif

#endif /* _TUNING_H */

