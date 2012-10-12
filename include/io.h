#pragma once

#include "types.h"

#define VA(x) ((void*)(x))

static inline __u8 readb(void *mem)
{
    return *(volatile __u8 *)mem;
}

static inline void writeb(void *mem, __u8 var)
{
    *(volatile __u8 *)mem = var;
}

static inline __u32 readl(void *mem)
{
    return *(volatile __u32 *)mem;
}

static inline void writel(void *mem, __u32 var)
{
    *(volatile __u32 *)mem = var;
}
