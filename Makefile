
CROSS_COMPILE = arm-maxwit-linux-gnueabi-

CC = $(CROSS_COMPILE)gcc
AS = $(CROSS_COMPILE)as
LD = $(CROSS_COMPILE)ld
OBJDUMP = $(CROSS_COMPILE)objdump
OBJCOPY = $(CROSS_COMPILE)objcopy

objs:= head.o

all : M-boot.bin M-boot.dis

M-boot.dis : M-boot.elf
	$(OBJDUMP) -D $< > $@

M-boot.bin : M-boot.elf
	$(OBJCOPY) -O binary -S $< $@

M-boot.elf : $(objs)
	$(LD) -T link.lds $^ -o $@

%.o : %.S
	$(AS) -c -o $@ $<

clean:
	@rm -vf M-boot* $(objs)
