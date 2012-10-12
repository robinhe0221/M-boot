#include "include/io.h"
#include "include/s3c2440.h"

int soc_init(void)
{
    /***Disable WDT ****/
    writel(VA(WTCON), 0x0);


    return 0;
}
