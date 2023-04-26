#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-V3_MCF1024.mk)" "nbproject/Makefile-local-V3_MCF1024.mk"
include nbproject/Makefile-local-V3_MCF1024.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=V3_MCF1024
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/bin_file_Ota_test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/bin_file_Ota_test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/V3_MCF1024/peripheral/adchs/plib_adchs.c ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac1.c ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac2.c ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac3.c ../src/config/V3_MCF1024/peripheral/clk/plib_clk.c ../src/config/V3_MCF1024/peripheral/eeprom/plib_eeprom.c ../src/config/V3_MCF1024/peripheral/evic/plib_evic.c ../src/config/V3_MCF1024/peripheral/gpio/plib_gpio.c ../src/config/V3_MCF1024/peripheral/mcpwm/plib_mcpwm.c ../src/config/V3_MCF1024/peripheral/spi/spi_master/plib_spi4_master.c ../src/config/V3_MCF1024/peripheral/uart/plib_uart1.c ../src/config/V3_MCF1024/stdio/xc32_monitor.c ../src/config/V3_MCF1024/initialization.c ../src/config/V3_MCF1024/interrupts.c ../src/config/V3_MCF1024/exceptions.c ../src/drivers/driver_ADC.c ../src/drivers/driver_GPIO.c ../src/drivers/driver_PWM.c ../src/drivers/driver_SPI.c ../src/drivers/driver_UART.c ../src/middleware/diagnostics.c ../src/middleware/fastmath.c ../src/middleware/tuning.c ../src/middleware/device_stat.c ../src/software/application_software.c ../src/software/fault.c ../src/software/state_engine.c ../src/main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1972949787/plib_adchs.o ${OBJECTDIR}/_ext/894868023/plib_cdac1.o ${OBJECTDIR}/_ext/894868023/plib_cdac2.o ${OBJECTDIR}/_ext/894868023/plib_cdac3.o ${OBJECTDIR}/_ext/444508452/plib_clk.o ${OBJECTDIR}/_ext/916064250/plib_eeprom.o ${OBJECTDIR}/_ext/894790895/plib_evic.o ${OBJECTDIR}/_ext/894737067/plib_gpio.o ${OBJECTDIR}/_ext/1961884374/plib_mcpwm.o ${OBJECTDIR}/_ext/1340093086/plib_spi4_master.o ${OBJECTDIR}/_ext/894334124/plib_uart1.o ${OBJECTDIR}/_ext/1780272356/xc32_monitor.o ${OBJECTDIR}/_ext/559960290/initialization.o ${OBJECTDIR}/_ext/559960290/interrupts.o ${OBJECTDIR}/_ext/559960290/exceptions.o ${OBJECTDIR}/_ext/1639450193/driver_ADC.o ${OBJECTDIR}/_ext/1639450193/driver_GPIO.o ${OBJECTDIR}/_ext/1639450193/driver_PWM.o ${OBJECTDIR}/_ext/1639450193/driver_SPI.o ${OBJECTDIR}/_ext/1639450193/driver_UART.o ${OBJECTDIR}/_ext/1375476428/diagnostics.o ${OBJECTDIR}/_ext/1375476428/fastmath.o ${OBJECTDIR}/_ext/1375476428/tuning.o ${OBJECTDIR}/_ext/1375476428/device_stat.o ${OBJECTDIR}/_ext/1200941409/application_software.o ${OBJECTDIR}/_ext/1200941409/fault.o ${OBJECTDIR}/_ext/1200941409/state_engine.o ${OBJECTDIR}/_ext/1360937237/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1972949787/plib_adchs.o.d ${OBJECTDIR}/_ext/894868023/plib_cdac1.o.d ${OBJECTDIR}/_ext/894868023/plib_cdac2.o.d ${OBJECTDIR}/_ext/894868023/plib_cdac3.o.d ${OBJECTDIR}/_ext/444508452/plib_clk.o.d ${OBJECTDIR}/_ext/916064250/plib_eeprom.o.d ${OBJECTDIR}/_ext/894790895/plib_evic.o.d ${OBJECTDIR}/_ext/894737067/plib_gpio.o.d ${OBJECTDIR}/_ext/1961884374/plib_mcpwm.o.d ${OBJECTDIR}/_ext/1340093086/plib_spi4_master.o.d ${OBJECTDIR}/_ext/894334124/plib_uart1.o.d ${OBJECTDIR}/_ext/1780272356/xc32_monitor.o.d ${OBJECTDIR}/_ext/559960290/initialization.o.d ${OBJECTDIR}/_ext/559960290/interrupts.o.d ${OBJECTDIR}/_ext/559960290/exceptions.o.d ${OBJECTDIR}/_ext/1639450193/driver_ADC.o.d ${OBJECTDIR}/_ext/1639450193/driver_GPIO.o.d ${OBJECTDIR}/_ext/1639450193/driver_PWM.o.d ${OBJECTDIR}/_ext/1639450193/driver_SPI.o.d ${OBJECTDIR}/_ext/1639450193/driver_UART.o.d ${OBJECTDIR}/_ext/1375476428/diagnostics.o.d ${OBJECTDIR}/_ext/1375476428/fastmath.o.d ${OBJECTDIR}/_ext/1375476428/tuning.o.d ${OBJECTDIR}/_ext/1375476428/device_stat.o.d ${OBJECTDIR}/_ext/1200941409/application_software.o.d ${OBJECTDIR}/_ext/1200941409/fault.o.d ${OBJECTDIR}/_ext/1200941409/state_engine.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1972949787/plib_adchs.o ${OBJECTDIR}/_ext/894868023/plib_cdac1.o ${OBJECTDIR}/_ext/894868023/plib_cdac2.o ${OBJECTDIR}/_ext/894868023/plib_cdac3.o ${OBJECTDIR}/_ext/444508452/plib_clk.o ${OBJECTDIR}/_ext/916064250/plib_eeprom.o ${OBJECTDIR}/_ext/894790895/plib_evic.o ${OBJECTDIR}/_ext/894737067/plib_gpio.o ${OBJECTDIR}/_ext/1961884374/plib_mcpwm.o ${OBJECTDIR}/_ext/1340093086/plib_spi4_master.o ${OBJECTDIR}/_ext/894334124/plib_uart1.o ${OBJECTDIR}/_ext/1780272356/xc32_monitor.o ${OBJECTDIR}/_ext/559960290/initialization.o ${OBJECTDIR}/_ext/559960290/interrupts.o ${OBJECTDIR}/_ext/559960290/exceptions.o ${OBJECTDIR}/_ext/1639450193/driver_ADC.o ${OBJECTDIR}/_ext/1639450193/driver_GPIO.o ${OBJECTDIR}/_ext/1639450193/driver_PWM.o ${OBJECTDIR}/_ext/1639450193/driver_SPI.o ${OBJECTDIR}/_ext/1639450193/driver_UART.o ${OBJECTDIR}/_ext/1375476428/diagnostics.o ${OBJECTDIR}/_ext/1375476428/fastmath.o ${OBJECTDIR}/_ext/1375476428/tuning.o ${OBJECTDIR}/_ext/1375476428/device_stat.o ${OBJECTDIR}/_ext/1200941409/application_software.o ${OBJECTDIR}/_ext/1200941409/fault.o ${OBJECTDIR}/_ext/1200941409/state_engine.o ${OBJECTDIR}/_ext/1360937237/main.o

# Source Files
SOURCEFILES=../src/config/V3_MCF1024/peripheral/adchs/plib_adchs.c ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac1.c ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac2.c ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac3.c ../src/config/V3_MCF1024/peripheral/clk/plib_clk.c ../src/config/V3_MCF1024/peripheral/eeprom/plib_eeprom.c ../src/config/V3_MCF1024/peripheral/evic/plib_evic.c ../src/config/V3_MCF1024/peripheral/gpio/plib_gpio.c ../src/config/V3_MCF1024/peripheral/mcpwm/plib_mcpwm.c ../src/config/V3_MCF1024/peripheral/spi/spi_master/plib_spi4_master.c ../src/config/V3_MCF1024/peripheral/uart/plib_uart1.c ../src/config/V3_MCF1024/stdio/xc32_monitor.c ../src/config/V3_MCF1024/initialization.c ../src/config/V3_MCF1024/interrupts.c ../src/config/V3_MCF1024/exceptions.c ../src/drivers/driver_ADC.c ../src/drivers/driver_GPIO.c ../src/drivers/driver_PWM.c ../src/drivers/driver_SPI.c ../src/drivers/driver_UART.c ../src/middleware/diagnostics.c ../src/middleware/fastmath.c ../src/middleware/tuning.c ../src/middleware/device_stat.c ../src/software/application_software.c ../src/software/fault.c ../src/software/state_engine.c ../src/main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

# The following macros may be used in the pre and post step lines
_/_=\\
ShExtension=.bat
Device=PIC32MK1024MCF064
ProjectDir="C:\work\firmware\Oct22\RD_testing\OTA_bin_file\firmware\bin_file_Ota_test.X"
ProjectName=bin_file_Ota_test
ConfName=V3_MCF1024
ImagePath="${DISTDIR}\bin_file_Ota_test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="${DISTDIR}"
ImageName="bin_file_Ota_test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-V3_MCF1024.mk ${DISTDIR}/bin_file_Ota_test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
	@echo "--------------------------------------"
	@echo "User defined post-build step: [${MP_CC_DIR}\xc32-objcopy -I ihex -O binary "${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.hex" "${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.bin"]"
	@${MP_CC_DIR}\xc32-objcopy -I ihex -O binary "${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.hex" "${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.bin"
	@echo "--------------------------------------"

MP_PROCESSOR_OPTION=32MK1024MCF064
MP_LINKER_FILE_OPTION=,--script="..\app_mk.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1972949787/plib_adchs.o: ../src/config/V3_MCF1024/peripheral/adchs/plib_adchs.c  .generated_files/flags/V3_MCF1024/21ca4d8855b077661b6f3fadef123d1da7805d09 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1972949787" 
	@${RM} ${OBJECTDIR}/_ext/1972949787/plib_adchs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1972949787/plib_adchs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1972949787/plib_adchs.o.d" -o ${OBJECTDIR}/_ext/1972949787/plib_adchs.o ../src/config/V3_MCF1024/peripheral/adchs/plib_adchs.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/894868023/plib_cdac1.o: ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac1.c  .generated_files/flags/V3_MCF1024/97e396e8eaa92d12b3aae581c01628718c3b8f3 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/894868023" 
	@${RM} ${OBJECTDIR}/_ext/894868023/plib_cdac1.o.d 
	@${RM} ${OBJECTDIR}/_ext/894868023/plib_cdac1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/894868023/plib_cdac1.o.d" -o ${OBJECTDIR}/_ext/894868023/plib_cdac1.o ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac1.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/894868023/plib_cdac2.o: ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac2.c  .generated_files/flags/V3_MCF1024/9af1b05f4e5b84e3de6a46ef65196d8a7c18a21c .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/894868023" 
	@${RM} ${OBJECTDIR}/_ext/894868023/plib_cdac2.o.d 
	@${RM} ${OBJECTDIR}/_ext/894868023/plib_cdac2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/894868023/plib_cdac2.o.d" -o ${OBJECTDIR}/_ext/894868023/plib_cdac2.o ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac2.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/894868023/plib_cdac3.o: ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac3.c  .generated_files/flags/V3_MCF1024/d9f2d29531feb6ec1f19832310f32316ea2ef0f2 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/894868023" 
	@${RM} ${OBJECTDIR}/_ext/894868023/plib_cdac3.o.d 
	@${RM} ${OBJECTDIR}/_ext/894868023/plib_cdac3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/894868023/plib_cdac3.o.d" -o ${OBJECTDIR}/_ext/894868023/plib_cdac3.o ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac3.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/444508452/plib_clk.o: ../src/config/V3_MCF1024/peripheral/clk/plib_clk.c  .generated_files/flags/V3_MCF1024/a65baa19b3da4f72e1d0a403b5060774dc0f977a .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/444508452" 
	@${RM} ${OBJECTDIR}/_ext/444508452/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/444508452/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/444508452/plib_clk.o.d" -o ${OBJECTDIR}/_ext/444508452/plib_clk.o ../src/config/V3_MCF1024/peripheral/clk/plib_clk.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/916064250/plib_eeprom.o: ../src/config/V3_MCF1024/peripheral/eeprom/plib_eeprom.c  .generated_files/flags/V3_MCF1024/6f77da3030758390fd4d3a1cea70d7513c8d8376 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/916064250" 
	@${RM} ${OBJECTDIR}/_ext/916064250/plib_eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/916064250/plib_eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/916064250/plib_eeprom.o.d" -o ${OBJECTDIR}/_ext/916064250/plib_eeprom.o ../src/config/V3_MCF1024/peripheral/eeprom/plib_eeprom.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/894790895/plib_evic.o: ../src/config/V3_MCF1024/peripheral/evic/plib_evic.c  .generated_files/flags/V3_MCF1024/9e1b6f24dfc6a5db972f0d9dc5a7540c8f08d418 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/894790895" 
	@${RM} ${OBJECTDIR}/_ext/894790895/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/894790895/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/894790895/plib_evic.o.d" -o ${OBJECTDIR}/_ext/894790895/plib_evic.o ../src/config/V3_MCF1024/peripheral/evic/plib_evic.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/894737067/plib_gpio.o: ../src/config/V3_MCF1024/peripheral/gpio/plib_gpio.c  .generated_files/flags/V3_MCF1024/68bee5fb0a0083229259f6e3b24318ec41ed1f8c .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/894737067" 
	@${RM} ${OBJECTDIR}/_ext/894737067/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/894737067/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/894737067/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/894737067/plib_gpio.o ../src/config/V3_MCF1024/peripheral/gpio/plib_gpio.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1961884374/plib_mcpwm.o: ../src/config/V3_MCF1024/peripheral/mcpwm/plib_mcpwm.c  .generated_files/flags/V3_MCF1024/347de162966c39d07fddad9be6cb07a42f06eb98 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1961884374" 
	@${RM} ${OBJECTDIR}/_ext/1961884374/plib_mcpwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1961884374/plib_mcpwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1961884374/plib_mcpwm.o.d" -o ${OBJECTDIR}/_ext/1961884374/plib_mcpwm.o ../src/config/V3_MCF1024/peripheral/mcpwm/plib_mcpwm.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340093086/plib_spi4_master.o: ../src/config/V3_MCF1024/peripheral/spi/spi_master/plib_spi4_master.c  .generated_files/flags/V3_MCF1024/890a0d2999c56ffd8e9320217cd216bf77f7de10 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1340093086" 
	@${RM} ${OBJECTDIR}/_ext/1340093086/plib_spi4_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340093086/plib_spi4_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340093086/plib_spi4_master.o.d" -o ${OBJECTDIR}/_ext/1340093086/plib_spi4_master.o ../src/config/V3_MCF1024/peripheral/spi/spi_master/plib_spi4_master.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/894334124/plib_uart1.o: ../src/config/V3_MCF1024/peripheral/uart/plib_uart1.c  .generated_files/flags/V3_MCF1024/79e7c815d78ec2028279e703e009cff9701eecee .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/894334124" 
	@${RM} ${OBJECTDIR}/_ext/894334124/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/894334124/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/894334124/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/894334124/plib_uart1.o ../src/config/V3_MCF1024/peripheral/uart/plib_uart1.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1780272356/xc32_monitor.o: ../src/config/V3_MCF1024/stdio/xc32_monitor.c  .generated_files/flags/V3_MCF1024/bbbbe5da27ed8864c6b88b05426316619d7695e1 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1780272356" 
	@${RM} ${OBJECTDIR}/_ext/1780272356/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1780272356/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1780272356/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1780272356/xc32_monitor.o ../src/config/V3_MCF1024/stdio/xc32_monitor.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/559960290/initialization.o: ../src/config/V3_MCF1024/initialization.c  .generated_files/flags/V3_MCF1024/29fc8312557ebc2ef13b4a8ee17f141ecb3d97f .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/559960290" 
	@${RM} ${OBJECTDIR}/_ext/559960290/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/559960290/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/559960290/initialization.o.d" -o ${OBJECTDIR}/_ext/559960290/initialization.o ../src/config/V3_MCF1024/initialization.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/559960290/interrupts.o: ../src/config/V3_MCF1024/interrupts.c  .generated_files/flags/V3_MCF1024/c1572723b5f86fbbdea945d3b3202df3b92b448d .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/559960290" 
	@${RM} ${OBJECTDIR}/_ext/559960290/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/559960290/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/559960290/interrupts.o.d" -o ${OBJECTDIR}/_ext/559960290/interrupts.o ../src/config/V3_MCF1024/interrupts.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/559960290/exceptions.o: ../src/config/V3_MCF1024/exceptions.c  .generated_files/flags/V3_MCF1024/fef12ba974f18e9b8e2f02b3c9b3dfb7bd1f8dd5 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/559960290" 
	@${RM} ${OBJECTDIR}/_ext/559960290/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/559960290/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/559960290/exceptions.o.d" -o ${OBJECTDIR}/_ext/559960290/exceptions.o ../src/config/V3_MCF1024/exceptions.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1639450193/driver_ADC.o: ../src/drivers/driver_ADC.c  .generated_files/flags/V3_MCF1024/64616940b4220a01dcdd8d08865b5a7465a35ad8 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1639450193" 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_ADC.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_ADC.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639450193/driver_ADC.o.d" -o ${OBJECTDIR}/_ext/1639450193/driver_ADC.o ../src/drivers/driver_ADC.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1639450193/driver_GPIO.o: ../src/drivers/driver_GPIO.c  .generated_files/flags/V3_MCF1024/4be47d1675f7493b339c90bc3f93b5f4c99c7c6c .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1639450193" 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_GPIO.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_GPIO.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639450193/driver_GPIO.o.d" -o ${OBJECTDIR}/_ext/1639450193/driver_GPIO.o ../src/drivers/driver_GPIO.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1639450193/driver_PWM.o: ../src/drivers/driver_PWM.c  .generated_files/flags/V3_MCF1024/8fb15cbe890633a00f34f8bd1f233f8f9d24f5f1 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1639450193" 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_PWM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_PWM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639450193/driver_PWM.o.d" -o ${OBJECTDIR}/_ext/1639450193/driver_PWM.o ../src/drivers/driver_PWM.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1639450193/driver_SPI.o: ../src/drivers/driver_SPI.c  .generated_files/flags/V3_MCF1024/e0adb2185c3a2c62b027ff58fa9a070e9dce7646 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1639450193" 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_SPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_SPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639450193/driver_SPI.o.d" -o ${OBJECTDIR}/_ext/1639450193/driver_SPI.o ../src/drivers/driver_SPI.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1639450193/driver_UART.o: ../src/drivers/driver_UART.c  .generated_files/flags/V3_MCF1024/325f62e6f4194a36678fa9f6766cbd9d6f35adb6 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1639450193" 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_UART.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_UART.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639450193/driver_UART.o.d" -o ${OBJECTDIR}/_ext/1639450193/driver_UART.o ../src/drivers/driver_UART.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1375476428/diagnostics.o: ../src/middleware/diagnostics.c  .generated_files/flags/V3_MCF1024/3ae3aeac6b1d5e8fe985fd1fa4914b94127d047a .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1375476428" 
	@${RM} ${OBJECTDIR}/_ext/1375476428/diagnostics.o.d 
	@${RM} ${OBJECTDIR}/_ext/1375476428/diagnostics.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1375476428/diagnostics.o.d" -o ${OBJECTDIR}/_ext/1375476428/diagnostics.o ../src/middleware/diagnostics.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1375476428/fastmath.o: ../src/middleware/fastmath.c  .generated_files/flags/V3_MCF1024/332d38fbc1981b5897c6bb76f5436296321e12f4 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1375476428" 
	@${RM} ${OBJECTDIR}/_ext/1375476428/fastmath.o.d 
	@${RM} ${OBJECTDIR}/_ext/1375476428/fastmath.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1375476428/fastmath.o.d" -o ${OBJECTDIR}/_ext/1375476428/fastmath.o ../src/middleware/fastmath.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1375476428/tuning.o: ../src/middleware/tuning.c  .generated_files/flags/V3_MCF1024/80ab631f8669d01172cf6eda86f5b4f109b5d1f5 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1375476428" 
	@${RM} ${OBJECTDIR}/_ext/1375476428/tuning.o.d 
	@${RM} ${OBJECTDIR}/_ext/1375476428/tuning.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1375476428/tuning.o.d" -o ${OBJECTDIR}/_ext/1375476428/tuning.o ../src/middleware/tuning.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1375476428/device_stat.o: ../src/middleware/device_stat.c  .generated_files/flags/V3_MCF1024/8eaaeeeea369654ccc34b092ab7e4aef5c621e03 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1375476428" 
	@${RM} ${OBJECTDIR}/_ext/1375476428/device_stat.o.d 
	@${RM} ${OBJECTDIR}/_ext/1375476428/device_stat.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1375476428/device_stat.o.d" -o ${OBJECTDIR}/_ext/1375476428/device_stat.o ../src/middleware/device_stat.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1200941409/application_software.o: ../src/software/application_software.c  .generated_files/flags/V3_MCF1024/1c40ce54bae8aa91f267014cd651aa20842621c0 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1200941409" 
	@${RM} ${OBJECTDIR}/_ext/1200941409/application_software.o.d 
	@${RM} ${OBJECTDIR}/_ext/1200941409/application_software.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1200941409/application_software.o.d" -o ${OBJECTDIR}/_ext/1200941409/application_software.o ../src/software/application_software.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1200941409/fault.o: ../src/software/fault.c  .generated_files/flags/V3_MCF1024/c5d63b1219077960f157fe9102c0f7ca7a3731dd .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1200941409" 
	@${RM} ${OBJECTDIR}/_ext/1200941409/fault.o.d 
	@${RM} ${OBJECTDIR}/_ext/1200941409/fault.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1200941409/fault.o.d" -o ${OBJECTDIR}/_ext/1200941409/fault.o ../src/software/fault.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1200941409/state_engine.o: ../src/software/state_engine.c  .generated_files/flags/V3_MCF1024/8619b98fbb208a6b92628462bf0856d477aaa9b1 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1200941409" 
	@${RM} ${OBJECTDIR}/_ext/1200941409/state_engine.o.d 
	@${RM} ${OBJECTDIR}/_ext/1200941409/state_engine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1200941409/state_engine.o.d" -o ${OBJECTDIR}/_ext/1200941409/state_engine.o ../src/software/state_engine.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/V3_MCF1024/ca19aa839dc7268c9a0b514e895f513117583180 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1972949787/plib_adchs.o: ../src/config/V3_MCF1024/peripheral/adchs/plib_adchs.c  .generated_files/flags/V3_MCF1024/9436d4428df2a545f6c4f25cb46899d34634b64 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1972949787" 
	@${RM} ${OBJECTDIR}/_ext/1972949787/plib_adchs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1972949787/plib_adchs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1972949787/plib_adchs.o.d" -o ${OBJECTDIR}/_ext/1972949787/plib_adchs.o ../src/config/V3_MCF1024/peripheral/adchs/plib_adchs.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/894868023/plib_cdac1.o: ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac1.c  .generated_files/flags/V3_MCF1024/633aa19bbe2ab00160f9bae5e87bd76cdd18bec1 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/894868023" 
	@${RM} ${OBJECTDIR}/_ext/894868023/plib_cdac1.o.d 
	@${RM} ${OBJECTDIR}/_ext/894868023/plib_cdac1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/894868023/plib_cdac1.o.d" -o ${OBJECTDIR}/_ext/894868023/plib_cdac1.o ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac1.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/894868023/plib_cdac2.o: ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac2.c  .generated_files/flags/V3_MCF1024/57c7ea009ca56272b958c7230664a3aa7f70bf2c .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/894868023" 
	@${RM} ${OBJECTDIR}/_ext/894868023/plib_cdac2.o.d 
	@${RM} ${OBJECTDIR}/_ext/894868023/plib_cdac2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/894868023/plib_cdac2.o.d" -o ${OBJECTDIR}/_ext/894868023/plib_cdac2.o ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac2.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/894868023/plib_cdac3.o: ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac3.c  .generated_files/flags/V3_MCF1024/37aad27f51c9061140435acc961dcd85dbe98649 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/894868023" 
	@${RM} ${OBJECTDIR}/_ext/894868023/plib_cdac3.o.d 
	@${RM} ${OBJECTDIR}/_ext/894868023/plib_cdac3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/894868023/plib_cdac3.o.d" -o ${OBJECTDIR}/_ext/894868023/plib_cdac3.o ../src/config/V3_MCF1024/peripheral/cdac/plib_cdac3.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/444508452/plib_clk.o: ../src/config/V3_MCF1024/peripheral/clk/plib_clk.c  .generated_files/flags/V3_MCF1024/8e99f08cc934db562902cfab35278457ba33a11d .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/444508452" 
	@${RM} ${OBJECTDIR}/_ext/444508452/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/444508452/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/444508452/plib_clk.o.d" -o ${OBJECTDIR}/_ext/444508452/plib_clk.o ../src/config/V3_MCF1024/peripheral/clk/plib_clk.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/916064250/plib_eeprom.o: ../src/config/V3_MCF1024/peripheral/eeprom/plib_eeprom.c  .generated_files/flags/V3_MCF1024/99697c4ef4e445e71e92aed9b6bd3f7febade101 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/916064250" 
	@${RM} ${OBJECTDIR}/_ext/916064250/plib_eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/916064250/plib_eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/916064250/plib_eeprom.o.d" -o ${OBJECTDIR}/_ext/916064250/plib_eeprom.o ../src/config/V3_MCF1024/peripheral/eeprom/plib_eeprom.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/894790895/plib_evic.o: ../src/config/V3_MCF1024/peripheral/evic/plib_evic.c  .generated_files/flags/V3_MCF1024/d2b1d7f3a194464a71c3329cf072ec0bff950413 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/894790895" 
	@${RM} ${OBJECTDIR}/_ext/894790895/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/894790895/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/894790895/plib_evic.o.d" -o ${OBJECTDIR}/_ext/894790895/plib_evic.o ../src/config/V3_MCF1024/peripheral/evic/plib_evic.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/894737067/plib_gpio.o: ../src/config/V3_MCF1024/peripheral/gpio/plib_gpio.c  .generated_files/flags/V3_MCF1024/d25ee0e4cdce34a51f42b0b2ad164695fdb4919a .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/894737067" 
	@${RM} ${OBJECTDIR}/_ext/894737067/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/894737067/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/894737067/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/894737067/plib_gpio.o ../src/config/V3_MCF1024/peripheral/gpio/plib_gpio.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1961884374/plib_mcpwm.o: ../src/config/V3_MCF1024/peripheral/mcpwm/plib_mcpwm.c  .generated_files/flags/V3_MCF1024/2b9e5e199bc555943086f7fe0fe1507f8bfcf9c4 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1961884374" 
	@${RM} ${OBJECTDIR}/_ext/1961884374/plib_mcpwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1961884374/plib_mcpwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1961884374/plib_mcpwm.o.d" -o ${OBJECTDIR}/_ext/1961884374/plib_mcpwm.o ../src/config/V3_MCF1024/peripheral/mcpwm/plib_mcpwm.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340093086/plib_spi4_master.o: ../src/config/V3_MCF1024/peripheral/spi/spi_master/plib_spi4_master.c  .generated_files/flags/V3_MCF1024/931cb193236db1e5363cfb5bef7a06758f070b49 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1340093086" 
	@${RM} ${OBJECTDIR}/_ext/1340093086/plib_spi4_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340093086/plib_spi4_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340093086/plib_spi4_master.o.d" -o ${OBJECTDIR}/_ext/1340093086/plib_spi4_master.o ../src/config/V3_MCF1024/peripheral/spi/spi_master/plib_spi4_master.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/894334124/plib_uart1.o: ../src/config/V3_MCF1024/peripheral/uart/plib_uart1.c  .generated_files/flags/V3_MCF1024/b33e4249b7df06fcc353211075e97ad2da0f261e .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/894334124" 
	@${RM} ${OBJECTDIR}/_ext/894334124/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/894334124/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/894334124/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/894334124/plib_uart1.o ../src/config/V3_MCF1024/peripheral/uart/plib_uart1.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1780272356/xc32_monitor.o: ../src/config/V3_MCF1024/stdio/xc32_monitor.c  .generated_files/flags/V3_MCF1024/ebf0f78718d7af0d4a28a0e62d04fc9a91204a1c .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1780272356" 
	@${RM} ${OBJECTDIR}/_ext/1780272356/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1780272356/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1780272356/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1780272356/xc32_monitor.o ../src/config/V3_MCF1024/stdio/xc32_monitor.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/559960290/initialization.o: ../src/config/V3_MCF1024/initialization.c  .generated_files/flags/V3_MCF1024/6c1c115bec14645f6f70b03157b457f553c6b6c .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/559960290" 
	@${RM} ${OBJECTDIR}/_ext/559960290/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/559960290/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/559960290/initialization.o.d" -o ${OBJECTDIR}/_ext/559960290/initialization.o ../src/config/V3_MCF1024/initialization.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/559960290/interrupts.o: ../src/config/V3_MCF1024/interrupts.c  .generated_files/flags/V3_MCF1024/d48de61c3d2898602db0801fb7798b789c85fd88 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/559960290" 
	@${RM} ${OBJECTDIR}/_ext/559960290/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/559960290/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/559960290/interrupts.o.d" -o ${OBJECTDIR}/_ext/559960290/interrupts.o ../src/config/V3_MCF1024/interrupts.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/559960290/exceptions.o: ../src/config/V3_MCF1024/exceptions.c  .generated_files/flags/V3_MCF1024/d704948cdaa76f424decbb3e69a9688c868d0c12 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/559960290" 
	@${RM} ${OBJECTDIR}/_ext/559960290/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/559960290/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/559960290/exceptions.o.d" -o ${OBJECTDIR}/_ext/559960290/exceptions.o ../src/config/V3_MCF1024/exceptions.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1639450193/driver_ADC.o: ../src/drivers/driver_ADC.c  .generated_files/flags/V3_MCF1024/65522bc3c6f02974debd6084638a1b4d76aae0fc .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1639450193" 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_ADC.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_ADC.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639450193/driver_ADC.o.d" -o ${OBJECTDIR}/_ext/1639450193/driver_ADC.o ../src/drivers/driver_ADC.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1639450193/driver_GPIO.o: ../src/drivers/driver_GPIO.c  .generated_files/flags/V3_MCF1024/f50da7a1bc02bca9173b8e634ad638b8d9029cfb .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1639450193" 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_GPIO.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_GPIO.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639450193/driver_GPIO.o.d" -o ${OBJECTDIR}/_ext/1639450193/driver_GPIO.o ../src/drivers/driver_GPIO.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1639450193/driver_PWM.o: ../src/drivers/driver_PWM.c  .generated_files/flags/V3_MCF1024/a7a1297b751cff8c09c2ba6066e678fac1c3b41b .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1639450193" 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_PWM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_PWM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639450193/driver_PWM.o.d" -o ${OBJECTDIR}/_ext/1639450193/driver_PWM.o ../src/drivers/driver_PWM.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1639450193/driver_SPI.o: ../src/drivers/driver_SPI.c  .generated_files/flags/V3_MCF1024/7a063175634bbabc56f8a555633339c2201c2f72 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1639450193" 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_SPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_SPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639450193/driver_SPI.o.d" -o ${OBJECTDIR}/_ext/1639450193/driver_SPI.o ../src/drivers/driver_SPI.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1639450193/driver_UART.o: ../src/drivers/driver_UART.c  .generated_files/flags/V3_MCF1024/d20a066a1013e5b399060923cbbf4cf6487c557a .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1639450193" 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_UART.o.d 
	@${RM} ${OBJECTDIR}/_ext/1639450193/driver_UART.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1639450193/driver_UART.o.d" -o ${OBJECTDIR}/_ext/1639450193/driver_UART.o ../src/drivers/driver_UART.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1375476428/diagnostics.o: ../src/middleware/diagnostics.c  .generated_files/flags/V3_MCF1024/2e310d9a84212caa2c93ac6d2d7c0c05f9d8c984 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1375476428" 
	@${RM} ${OBJECTDIR}/_ext/1375476428/diagnostics.o.d 
	@${RM} ${OBJECTDIR}/_ext/1375476428/diagnostics.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1375476428/diagnostics.o.d" -o ${OBJECTDIR}/_ext/1375476428/diagnostics.o ../src/middleware/diagnostics.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1375476428/fastmath.o: ../src/middleware/fastmath.c  .generated_files/flags/V3_MCF1024/904dc94e6dc07d5090b131742a6748f605639d30 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1375476428" 
	@${RM} ${OBJECTDIR}/_ext/1375476428/fastmath.o.d 
	@${RM} ${OBJECTDIR}/_ext/1375476428/fastmath.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1375476428/fastmath.o.d" -o ${OBJECTDIR}/_ext/1375476428/fastmath.o ../src/middleware/fastmath.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1375476428/tuning.o: ../src/middleware/tuning.c  .generated_files/flags/V3_MCF1024/cd7d37b8ab821d4f009855d4929bde519fa76de .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1375476428" 
	@${RM} ${OBJECTDIR}/_ext/1375476428/tuning.o.d 
	@${RM} ${OBJECTDIR}/_ext/1375476428/tuning.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1375476428/tuning.o.d" -o ${OBJECTDIR}/_ext/1375476428/tuning.o ../src/middleware/tuning.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1375476428/device_stat.o: ../src/middleware/device_stat.c  .generated_files/flags/V3_MCF1024/ef6cba8acc074ece987880630f013556095d71eb .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1375476428" 
	@${RM} ${OBJECTDIR}/_ext/1375476428/device_stat.o.d 
	@${RM} ${OBJECTDIR}/_ext/1375476428/device_stat.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1375476428/device_stat.o.d" -o ${OBJECTDIR}/_ext/1375476428/device_stat.o ../src/middleware/device_stat.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1200941409/application_software.o: ../src/software/application_software.c  .generated_files/flags/V3_MCF1024/63c99c209031e1acbeff144e0fa053d952427fed .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1200941409" 
	@${RM} ${OBJECTDIR}/_ext/1200941409/application_software.o.d 
	@${RM} ${OBJECTDIR}/_ext/1200941409/application_software.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1200941409/application_software.o.d" -o ${OBJECTDIR}/_ext/1200941409/application_software.o ../src/software/application_software.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1200941409/fault.o: ../src/software/fault.c  .generated_files/flags/V3_MCF1024/3b30fd8b43c88c6aa895a49bdb0d8c8640959068 .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1200941409" 
	@${RM} ${OBJECTDIR}/_ext/1200941409/fault.o.d 
	@${RM} ${OBJECTDIR}/_ext/1200941409/fault.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1200941409/fault.o.d" -o ${OBJECTDIR}/_ext/1200941409/fault.o ../src/software/fault.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1200941409/state_engine.o: ../src/software/state_engine.c  .generated_files/flags/V3_MCF1024/60041335b316f12d60f1fb4e746ae89ee8c3b4cd .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1200941409" 
	@${RM} ${OBJECTDIR}/_ext/1200941409/state_engine.o.d 
	@${RM} ${OBJECTDIR}/_ext/1200941409/state_engine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1200941409/state_engine.o.d" -o ${OBJECTDIR}/_ext/1200941409/state_engine.o ../src/software/state_engine.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/V3_MCF1024/d338e34dd974e2d3533d1e8c9682c6d2e84d5e8e .generated_files/flags/V3_MCF1024/470468cb027e3aa6fe4d56c68f7c2457552d459c
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/V3_MCF1024" -I"../src/drivers" -I"../src/firmware" -I"../src/middleware" -I"../src/software" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/bin_file_Ota_test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../app_mk.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/bin_file_Ota_test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x36F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/bin_file_Ota_test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../app_mk.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/bin_file_Ota_test.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_V3_MCF1024=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/bin_file_Ota_test.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
