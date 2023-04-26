#ifndef DRIVER_GPIO_H
#define	DRIVER_GPIO_H

#ifdef	__cplusplus
extern "C" {
#endif

    void turn_on_LED(void);
    void turn_off_LED(void);
    void LED_blink(int); //no. of blinks


#ifdef	__cplusplus
}
#endif

#endif	/* DRIVER_GPIO_H */

