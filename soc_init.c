#include "s3c2440.h"

void disable_watch_dog(void)
{
    WTCON = 0;
}
