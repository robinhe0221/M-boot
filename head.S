    .global _start
    .global hang    

_start:
    b handle_reset
    ldr pc, [pc, #20]	    @und
    ldr pc, [pc, #20]	    @swi
    ldr pc, [pc, #20]	    @iabt
    ldr pc, [pc, #20]	    @dabt
    .word   _start
    ldr pc, [pc, #16]	    @irq	    
    ldr pc, [pc, #16]	    @fiq

    .word   handle_undef
    .word   handle_swi
    .word   handle_iabt
    .word   handle_dabt
    .word   handle_irq
    .word   handle_fiq

handle_reset:
    msr	cpsr, #(1 << 6 | 1 << 7 | 0x13) @SVC mode

    bl soc_init

@    bl urat_init   

@    bl mem_init

@    bl	main

handle_undef:
    b hang

handle_swi:
    b hang

handle_iabt:
    b hang

handle_dabt:
    b hang

handle_irq:
    b hang

handle_fiq:
    b hang

hang:
    b hang
