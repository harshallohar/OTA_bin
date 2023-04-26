/* 
 * File:   DEVSNfile.h
 * Author: saura
 *
 * Created on 22 August, 2022, 2:56 PM
 */

#ifndef DEVSNFILE_H
#define	DEVSNFILE_H

#ifdef	__cplusplus
extern "C" {
#endif
    
    const long int CODESN0 = 0x1;
    const long int CODESN1 = 0x10001;
    
    
    const long int DEVSN0LIST[3] = {
        0x002d002e,         //test board 1: PIC32MK1024MCF
        0x001b004f,         //test board 2: PIC32MK1024MCF
        0x003b0049          //add third test board here   
    };
    
    const long int DEVSN1LIST[3] = {
        0x50485748,
        0x50485748,
        0x50424601
    };
#ifdef	__cplusplus
}
#endif

#endif	/* DEVSNFILE_H */

