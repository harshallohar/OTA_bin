#include "device.h"
#include "driver_ADC.h"
#include "math.h"
    
	#define ISCALE 1100.0
	#define VSCALE 100
	#define TSCALE 30.0
	#define TOFFSET 12.0
	#define INPUT_SCALE 5.0

	static int Iu_adc = 2048, Iw_adc = 2048, Idc_adc = 2048, Vdc_adc = 0;	//Direct ADC values, needed for checking faults
	static float Iu_off = 2048, Iw_off = 2048, Idc_off = 2048;				//Offsets in currents, to be caliberated using 'adc_calib()'

    
	static float fMRcos = 0, fMRsin = 0;									//Filtered MR sensor input for magnitude calaculation
    static float UMRcos, UMRsin;                                            //Need unit for speed calc
	static float fMRCS_mag = 0.8;											//MR sensor magnitude
	static float MRcos0, MRsin0; 											//MR sensor angle offset to match 'rotor zero'

	static float fTu = 0, fTv = 0, fTw = 0, fTdc = 0, fTm = 0;						//temperatures for fault checking


	static int Vflt = 3000, Ifltp = 4000, Ifltn = 100, Idcfltp = 4000, Idcfltn = 100, Vflti = 4000;	//Fault limits
	static float tflt = 110.0; 
    

void measurement_constants_update(float c0, float s0, float Vflt, float Idcflt, float Iflt, float Tflt)
{
	MRcos0 = c0;
	MRsin0 = s0;
	   
	Ifltp = 2048 + (int)( Iflt * 4096/ISCALE);			//calculate phase current fault limits
	Ifltn = 2048 - (int)( Iflt * 4096/ISCALE);	
    
    if(Ifltp > 3996) Ifltp = 3996;
    if(Ifltp < 3000) Ifltp = 3000;
    
    if(Ifltn < 100) Ifltp = 100;
    if(Ifltn > 1000) Ifltp = 1000;
	
	Idcfltp = 2048 + (int)( Idcflt * 4096/ISCALE);  	//calculate DC current fault limits
	Idcfltn = 2048 - (int)( Idcflt * 4096/ISCALE);	
    
    if(Idcfltp > 3996) Idcfltp = 3996;
    if(Idcfltp < 3000) Idcfltp = 3000;
    
    if(Idcfltn < 100) Idcfltp = 100;
    if(Idcfltn > 1000) Idcfltp = 1000;
    
	Vflti = (int)(Vflt * 4096 / VSCALE);				//calculate voltage fault limits
    
    if(Vflti > 3300) Vflti = 3300;
    if(Vflti < 1000) Vflti = 1000;
	
	tflt = Tflt;										//Temperature fault limit
    
    if(tflt > 130)  tflt = 130.0;
    if(tflt < 50)   tflt = 50;    
}

void ADC_calib()
{
    Iu_off = Iu_off + 0.01*((float)Iu_adc - Iu_off);	//ADC current measurement offsets: zero caliberation
    Iw_off = Iw_off + 0.01*((float)Iw_adc - Iw_off);  	
    Idc_off = Idc_off + 0.01*((float)Idc_adc - Idc_off); 
}


void fast_measurement_VI(float *Vdc, float *Idc, float *Iu, float *Iv, float *Iw)
{
	if(ADCDSTAT1bits.ARDY0) Vdc_adc = ADCDATA0;
    if(ADCDSTAT1bits.ARDY1) Iu_adc = ADCDATA1;
    if(ADCDSTAT1bits.ARDY2) Iw_adc = ADCDATA2; 
    if(ADCDSTAT1bits.ARDY3) Idc_adc = ADCDATA3;

	*Iu = (float)Iu_adc;
    *Iu = (*Iu - Iu_off)*(ISCALE / 4096.0);
    
    *Iw = (float)Iw_adc;
    *Iw = (*Iw - Iw_off)*(ISCALE / 4096.0);
    
    *Iv = - *Iu - *Iw;
     
    *Idc = (float)Idc_adc;
    *Idc = (*Idc - Idc_off)*(ISCALE / 4096.0);    
    
    *Vdc = (float)Vdc_adc;  
    *Vdc = *Vdc * (VSCALE / 4096.0);
}

void fast_measurement_RP(float *cosMR, float *sinMR, int MRdirection)
{
	int MRcosN = 0, MRcosP = 0, MRsinN = 0, MRsinP = 0;
  
	float MRcos, MRsin;
    float cos5MR, sin5MR;

    float cos_r2, cos_r3, cos_r5;
    float sin_r2, sin_r3, sin_r5;
	
    if(ADCDSTAT1bits.ARDY12) MRcosP = ADCDATA12;
    if(ADCDSTAT1bits.ARDY13) MRsinP = ADCDATA13;
    if(ADCDSTAT1bits.ARDY14) MRcosN = ADCDATA14;
    if(ADCDSTAT1bits.ARDY15) MRsinN = ADCDATA15;
    
    MRcos = ((float)MRcosP - (float)MRcosN)/4096;   //convert to float
    MRsin = ((float)MRsinP - (float)MRsinN)/4096;
        
    if(MRdirection == 1) MRsin = -MRsin;        //for reversing sensor orientation: CW/CCW
   
    fMRcos = fMRcos + 0.8*(MRcos - fMRcos);			//filter
    fMRsin = fMRsin + 0.8*(MRsin - fMRsin);
        
    fMRCS_mag = sqrt(fMRcos*fMRcos + fMRsin*fMRsin);
    if(fMRCS_mag <= 0.1) fMRCS_mag = 0.1; 
    
    UMRcos = fMRcos/fMRCS_mag;    					//unit
    UMRsin = fMRsin/fMRCS_mag;    					//unit
    
    //DAC1CONbits.DACDAT = (int)((fMRcos + 1)*2000.0);
        
    cos_r2 = UMRcos * UMRcos;						//frequency*5
    cos_r3 = cos_r2 * UMRcos;
    cos_r5 = cos_r3 * cos_r2;

    sin_r2 = UMRsin * UMRsin;
    sin_r3 = sin_r2 * UMRsin;
    sin_r5 = sin_r3 * sin_r2;

    cos5MR = 16.0*cos_r5 - 20.0*cos_r3 + 5.0*UMRcos;
    sin5MR = 16.0*sin_r5 - 20.0*sin_r3 + 5.0*UMRsin;

    cos5MR = 0.8165 * cos5MR;						//power invarient dq
    sin5MR = 0.8165 * sin5MR;
    
    *cosMR = cos5MR * MRcos0 + sin5MR * MRsin0; 	//angle offset
    *sinMR = - sin5MR * MRcos0 + cos5MR * MRsin0; 
        
    DAC1CONbits.DACDAT = (int)((*cosMR + 1)*2000.0);
}


void slow_measurement_T(float *Tu_adr, float *Tv_adr, float *Tw_adr, float *Tdc_adr, float *Tm_adr)
{
	int tu = 0, tv = 0, tw = 0, tdc = 0, tm = 0;   
    float Tu, Tv, Tw, Tdc, Tm;
	
	if(ADCDSTAT1bits.ARDY10) tu = ADCDATA10;
    if(ADCDSTAT1bits.ARDY9) tv = ADCDATA9;
    if(ADCDSTAT1bits.ARDY8) tw = ADCDATA8;
    if(ADCDSTAT1bits.ARDY11) tdc = ADCDATA11;
    
    if(ADCDSTAT1bits.ARDY17) tm = ADCDATA17;
    
    //NTCG203JH472JT1   (3J = B3450, R1 = 330)
    #define TDIV 30.0
    #define TADD 12.0
    
    
	Tu = ((float)tu)/TDIV + TADD;				//sensor type
	Tv = ((float)tv)/TDIV + TADD;
	Tw = ((float)tw)/TDIV + TADD;
    Tdc = ((float)tdc)/TDIV + TADD;
    Tm = ((float)tm)/30.0 + 16;    
    //NTCALUG02A502G   (B3984, R1 = 330)
    
    fTu = fTu + 0.01*(Tu - fTu);
    fTv = fTv + 0.01*(Tv - fTv);
    fTw = fTw + 0.01*(Tw - fTw);
    fTdc = fTdc + 0.01*(Tdc - fTdc);
    fTm = fTm + 0.01*(Tm - fTm);
    
    *Tu_adr = fTu;
    *Tv_adr = fTv;
    *Tw_adr = fTw;
    *Tdc_adr = fTdc;
    *Tm_adr = fTm;
}

void slow_measurement_input(float sdt, float *adr_wSensor, float *fThrottle)
{
	int Throttle = 0;
	static float prev_cos = 0, prev_sin = 0;
	static float wMech = 0, fwMech = 0;
	float dcos, dsin;	
	
	dcos = (UMRcos - prev_cos)/(sdt);
    dsin = (UMRsin - prev_sin)/(sdt);
    
    wMech = UMRsin*dcos - UMRcos*dsin; 
    
    fwMech = fwMech + 0.005*(wMech - fwMech);
    
    prev_cos = UMRcos;
    prev_sin = UMRsin;
    
    *adr_wSensor = 5*fwMech;
	
	if(ADCDSTAT1bits.ARDY19) Throttle = ADCDATA19; 
	
	*fThrottle = *fThrottle + 0.01*((float)(Throttle) * INPUT_SCALE / 4096.0 - *fThrottle);		
}

int fast_fault_check(void)
{
	int fault_id = 0;
	
	if(Idc_adc > Idcfltp) {fault_id = 3;}
    if(Idc_adc < Idcfltn) {fault_id = 3;}
	
    if(Vdc_adc > Vflt) {fault_id = 1;}
    if(Iu_adc > Ifltp) {fault_id = 2;}
    if(Iw_adc > Ifltp) {fault_id = 2;}
    if(Iu_adc < Ifltn) {fault_id = 2;}
    if(Iw_adc < Ifltn) {fault_id = 2;}
	
	return fault_id;
}

int slow_fault_check(void)
{
	int fault_id = 0;
	
	if(fTu > tflt) {fault_id = 4;}
    if(fTv > tflt) {fault_id = 4;}
    if(fTw > tflt) {fault_id = 4;}
	
	return fault_id;
}


