#Common code used to read the .config
ifeq ($(ARCH_LPC17XX),y)
	CPU=cortex-m
	BOARD=lpc17xx
	FLASH_ORIGIN=0x00000000
	RAM_BASE=0x10000000
	CFLAGS+=-DLPC17XX -mcpu=cortex-m3
endif

ifeq ($(ARCH_LM3S),y)
	CPU=cortex-m
	BOARD=lm3s
	FLASH_ORIGIN=0x00000000
	RAM_BASE=0x20000000
	CFLAGS+=-DLM3S -mcpu=cortex-m3
endif

ifeq ($(ARCH_STM32F4),y)
	CPU=cortex-m
	BOARD=stm32f4
	FLASH_ORIGIN=0x08000000
	RAM_BASE=0x20000000
	CFLAGS+=-DSTM32F4 -mcpu=cortex-m4 -mfloat-abi=soft
	OPENCM3FLAGS=FP_FLAGS="-mfloat-abi=soft" 
endif

ifeq ($(FLASH_SIZE_2MB),y)
	FLASH_SIZE=2048
endif
ifeq ($(FLASH_SIZE_1MB),y)
	FLASH_SIZE=1024
endif
ifeq ($(FLASH_SIZE_512KB),y)
	FLASH_SIZE=512
endif
ifeq ($(FLASH_SIZE_384KB),y)
	FLASH_SIZE=384
endif
ifeq ($(FLASH_SIZE_256KB),y)
	FLASH_SIZE=256
endif
ifeq ($(FLASH_SIZE_128KB),y)
	FLASH_SIZE=128
endif

ifeq ($(RAM_SIZE_192KB),y)
	RAM_SIZE=192
endif
ifeq ($(RAM_SIZE_128KB),y)
	RAM_SIZE=128
endif
ifeq ($(RAM_SIZE_96KB),y)
	RAM_SIZE=96
endif
ifeq ($(RAM_SIZE_64KB),y)
	RAM_SIZE=64
endif
ifeq ($(RAM_SIZE_32KB),y)
	RAM_SIZE=32
endif
ifeq ($(RAM_SIZE_16KB),y)
	RAM_SIZE=16
endif

ifeq ($(CLK_48MHZ),y)
	CLK_SPEED=48
endif
ifeq ($(CLK_84MHZ),y)
	CLK_SPEED=84
endif
ifeq ($(CLK_120MHZ),y)
	CLK_SPEED=120
endif
ifeq ($(CLK_168MHZ),y)
	CLK_SPEED=168
endif

APPS_ORIGIN=$$(( $(KFLASHMEM_SIZE) * 1024))
CFLAGS+=-DFLASH_ORIGIN=$(FLASH_ORIGIN)
CFLAGS+=-DAPPS_ORIGIN=$(APPS_ORIGIN)
CFLAGS+=-DCONFIG_KRAM_SIZE=$(KRAMMEM_SIZE)
CFLAGS+=-DCONFIG_CLK_SPEED=$(CLK_SPEED)

