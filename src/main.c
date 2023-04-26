

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include "state_engine.h"
#include "device.h"
#include "driver_PWM.h"
#include "stdio.h"
#include "tuning.h"

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************



int main ( void )
{ 
    SYS_Initialize ( NULL );
    PWM_override_OFF();
    //EEPROM_BulkErase();
    //fill_empty_EEPROM();
    
    state_init();
        
    Nop();
    Nop();
    Nop();
    MCPWM_Start(); 
    
    while ( 1 )
    {
        Nop();
        slow_routines();
        Nop();
    }

    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/

