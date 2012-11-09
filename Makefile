-include .config

TOP_DIR  := $(shell pwd)
HEAD_DIR := $(TOP_DIR)/arch/arm

CROSS_COMPILE = arm-maxwit-linux-gnueabi-

CC = $(CROSS_COMPILE)gcc
AS = $(CROSS_COMPILE)as
LD = $(CROSS_COMPILE)ld
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump

CFLAGS = -ffreestanding -I $(TOP_DIR)/include -Wall -Werror -mno-thumb-interwork 

src = $(shell find ./ -name "*.c")

objs = $(patsubst %.c,%.o,$(src)) 

all : M-boot.bin M-boot.dis

M-boot.bin : M-boot.elf
	$(OBJCOPY) -O binary $< $@

M-boot.dis : M-boot.elf
	$(OBJDUMP) -D $< > $@

M-boot.elf : $(HEAD_DIR)/head.o $(objs)
	$(LD) -T $(HEAD_DIR)/M-boot.lds -Ttext $(CONFIG_START_MEM) $^ -o $@

$(HEAD_DIR)/head.o : $(HEAD_DIR)/head.S
	$(AS) $< -o $@

$(objs) : %.o : %.c
	$(CC) $(CFLAGS) $< -c -o $@

clean :
	@rm -vf M-boot.* $(objs) $(HEAD_DIR)/head.o
