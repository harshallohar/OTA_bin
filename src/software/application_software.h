
#ifndef APPLICATION_SOFTWARE_H
#define	APPLICATION_SOFTWARE_H

#ifdef	__cplusplus
extern "C" {
#endif

void drive_init(float);
void drive_reset(float *, float *);
int drive_condition(float, float);    
void current_ref_generator(float *, float *, float, float);
void current_ref_control(float);
void torque_speed_calculation(float, float, float, float *, float *, float *);
void speed_control(float, float);
void torque_control(float, float);
void angle_finder(float, float, int);

#ifdef	__cplusplus
}
#endif

#endif	/* APPLICATION_SOFTWARE_H */

