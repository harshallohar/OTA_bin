#include "driver_GPIO.h"
#include <proc/PIC32MK-MC/p32mk1024mcf064.h>

#define LED LATEbits.LATE15
#define LED_STATE PORTEbits.RE15


void turn_on_LED(void)
{
    LED = 1;
}

void turn_off_LED(void)
{
    LED = 0;
}

void LED_blink(int blink_value)
{
    #define LED_BLINK_ON_TIME 32000/2/2         
    #define LED_BLINK_OFF_TIME 32000/2/2
    
    static long int LED_time = 0;
    static int LED_blink_count = 0;   
    
    
    LED_time++;
    if(LED_STATE == 1)
    {
        if(LED_time > LED_BLINK_ON_TIME)
        {
            LED_time = 0;
            LED_blink_count++;
            LED = 0;
        }
    }
    else
    {
        if(LED_blink_count < blink_value)
        {
            if(LED_time > LED_BLINK_OFF_TIME)
            {
                LED_time = 0;
                LED = 1;
            }
        }
        else
        {
            if(LED_time > LED_BLINK_OFF_TIME*5)
            {
                LED_time = 0;
                LED_blink_count = 0;
            }            
        }        
    }    
    
}
