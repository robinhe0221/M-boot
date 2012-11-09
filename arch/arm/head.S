	.global _start
	.word (_end - _start)
	.word _start
_start:
	b	reset
	ldr pc, [pc, #20]
	ldr pc, [pc, #20]
	ldr pc, [pc, #20]
	ldr pc, [pc, #20]
	.word (_end - _start)
	ldr pc, [pc, #16]
	ldr pc, [pc, #16]

	.word handle_undef
	.word handle_swi
	.word handle_iabt
	.word handle_dabt
	.word handle_irq
	.word handle_fiq

reset:
	mov sp, #0x1000
	bl	soc_init
	b	reset

handle_undef:
	b handle_undef

handle_swi:
	b handle_swi

handle_iabt:
	b handle_iabt

handle_dabt:
	b handle_dabt

handle_irq:
	b handle_irq

handle_fiq:
	b handle_fiq
