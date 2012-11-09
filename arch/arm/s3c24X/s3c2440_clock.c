#include <io.h>
#include <arm/s3c2440.h>

#define s3c24x0_wdt_writel(reg, val) \
	writel(VA(WATCHDOG_BASE + reg), val)

int soc_init(void)
{
	//WDT
	s3c24x0_wdt_writel(WATCON, 0x0);

	//Clock
	//fix me

	return 0;
}

int mem_init(void)
{
	return 0;
}
