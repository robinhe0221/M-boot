OUTPUT_ARCH(ARM)

SECTIONS
{
	.text ALIGN(4):
	{
		*(.text)
	}

	.data ALIGN(4):
	{
		*(.data)
	}

	_end = ALIGN(4);
}
