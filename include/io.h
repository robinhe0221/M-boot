#pragma once

#include <types.h>

static inline void writel(void *mem, __u32 val)
{
	*(volatile __u32 *)mem = val;
}

static inline void writeb(void *mem, __u8 val)
{
	*(volatile __u8 *)mem = val;
}
