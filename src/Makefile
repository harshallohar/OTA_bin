
# Compiler options
CC = xc32-gcc
LD = xc32-ld
CFLAGS = -mprocessor=32MK1024MCF064 -I. -I./drivers -I./middleware -I./software -I./config/V3_MCF1024 -I./config/V3_MCF1024/peripheral/clk -I./config/V3_MCF1024/peripheral/evic -I./config/V3_MCF1024/peripheral/gpio -I./config/V3_MCF1024/peripheral/adchs -I./config/V3_MCF1024/peripheral/cdac -I./config/V3_MCF1024/peripheral/eeprom -I./config/V3_MCF1024/peripheral/mcpwm -I./config/V3_MCF1024/peripheral/spi/spi_master -I./config/V3_MCF1024/peripheral/uart -I./config/V3_MCF1024/stdio -O2 -Wall -g
LDFLAGS = -T./config/V3_MCF1024/app_mk.ld

# Source files
SRC = $(wildcard ./main.c) $(wildcard ./drivers/driver_ADC.c) $(wildcard ./drivers/driver_GPIO.c) $(wildcard ./drivers/driver_PWM.c) $(wildcard ./drivers/driver_SPI.c) $(wildcard ./drivers/driver_UART.c) $(wildcard ./middleware/device_stat.c) $(wildcard ./middleware/diagnostics.c) $(wildcard ./middleware/fastmath.c) $(wildcard ./middleware/tuning.c) $(wildcard ./software/application_software.c) $(wildcard ./software/fault.c) $(wildcard ./software/state_engine.c) $(wildcard ./config/V3_MCF1024/exceptions.c) $(wildcard ./config/V3_MCF1024/initialization.c) $(wildcard ./config/V3_MCF1024/interrupts.c) $(wildcard ./config/V3_MCF1024/peripheral/clk/plib_clk.c) $(wildcard ./config/V3_MCF1024/peripheral/adchs/plib_adchs.c) $(wildcard ./config/V3_MCF1024/peripheral/cdac/plib_cdac1.c) $(wildcard ./config/V3_MCF1024/peripheral/cdac/plib_cdac2.c) $(wildcard ./config/V3_MCF1024/peripheral/cdac/plib_cdac3.c) $(wildcard ./config/V3_MCF1024/peripheral/eeprom/plib_eeprom.c) $(wildcard ./config/V3_MCF1024/peripheral/evic/plib_evic.c) $(wildcard ./config/V3_MCF1024/peripheral/gpio/plib_gpio.c) $(wildcard ./config/V3_MCF1024/peripheral/mcpwm/plib_mcpwm.c) $(wildcard ./config/V3_MCF1024/peripheral/spi/spi_master/plib_spi1_master.c) $(wildcard ./config/V3_MCF1024/peripheral/spi/spi_master/plib_spi4_master.c) $(wildcard ./config/V3_MCF1024/peripheral/uart/plib_uart1.c) $(wildcard ./config/V3_MCF1024/stdio/xc32_monitor.c)

# Object files
OBJ = $(SRC:.c=.o)

# Output file
TARGET = myprogram.elf
HEXFILE = myprogram.hex
BINFILE = myprogram.bin

# Default target
all: $(TARGET) $(HEXFILE) $(BINFILE)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $(TARGET) $(OBJ)

$(HEXFILE): $(TARGET)
	xc32-objcopy -O ihex $(TARGET) $(HEXFILE)

$(BINFILE): $(HEXFILE)
	xc32-objcopy -O ihex -I binary $(HEXFILE) $(BINFILE)
	
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(TARGET) $(HEXFILE) $(BINFILE)

.PHONY: all clean
