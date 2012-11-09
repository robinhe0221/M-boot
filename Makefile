-include .config

TOP_DIR  := $(shell pwd)
HEAD_DIR := $(TOP_DIR)/arch/arm

CROSS_COMPILE = arm-maxwit-linux-gnueabi-

CC = $(CROSS_COMPILE)gcc
AS = $(CROSS_COMPILE)as
LD = $(CROSS_COMPILE)ld
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump

CFLAGS = -I $(TOP_DIR)/include

src = $(shell find ./ -name "*.c")

objs = $(patsubst %.c,%.o,$(src)) 

all : bl1.bin bl1.dis

bl1.bin : bl1.elf
	$(OBJCOPY) -O binary $< $@

bl1.dis : bl1.elf
	$(OBJDUMP) -D $< > $@

bl1.elf : $(HEAD_DIR)/head.o $(objs)
	$(LD) -T $(HEAD_DIR)/bl1.lds -Ttext $(CONFIG_START_MEM) $^ -o $@

$(HEAD_DIR)/head.o : $(HEAD_DIR)/head.S
	$(AS) $< -o $@

$(objs) : %.o : %.c
	$(CC) $(CFLAGS) $< -c -o $@

clean :
	@rm -vf bl1.* $(objs) $(HEAD_DIR)/head.o
