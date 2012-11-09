	.global cpu_init
	.text
cpu_init:
	bx lr

	.data
a:
	.space 2048, 0xff
