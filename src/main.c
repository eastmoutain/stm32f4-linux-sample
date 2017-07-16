#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include "stm32f4xx_conf.h"
#include "utils.h"

void ms_delay(int ms)
{
    while (ms-- > 0) {
        volatile int x = 5971;
        while (x--) {
            __asm("nop");
        }
    }
}


int main(void) {
    RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN;

    GPIOD->MODER = (1 <<26);

    for (;;) {
        ms_delay(500);
        GPIOD->ODR ^= (1 << 13);
    }
    int a = 1;
    
    return a+1;
		GPIO_SetBits(GPIOD, GPIO_Pin_12);
		GPIO_ResetBits(GPIOD, GPIO_Pin_12);

	return 0;
}


