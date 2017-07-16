
include_directories(${PROJECT_SOURCE_DIR}/lib)
include_directories(${PROJECT_SOURCE_DIR}/lib/inc)
include_directories(${PROJECT_SOURCE_DIR}/lib/inc/core)
include_directories(${PROJECT_SOURCE_DIR}/lib/inc/peripherals)


set(LIB_SRC_LIST 
    startup_stm32f4xx.s
    src/peripherals/misc.c
    src/peripherals/stm32f4xx_dma.c
    src/peripherals/stm32f4xx_rcc.c
    src/peripherals/stm32f4xx_adc.c
    src/peripherals/stm32f4xx_exti.c
    src/peripherals/stm32f4xx_rng.c
    src/peripherals/stm32f4xx_can.c
    src/peripherals/stm32f4xx_flash.c
    src/peripherals/stm32f4xx_rtc.c
    src/peripherals/stm32f4xx_crc.c
    src/peripherals/stm32f4xx_fsmc.c
    src/peripherals/stm32f4xx_sdio.c
    src/peripherals/stm32f4xx_cryp_aes.c
    src/peripherals/stm32f4xx_gpio.c
    src/peripherals/stm32f4xx_spi.c
    src/peripherals/stm32f4xx_cryp.c
    src/peripherals/stm32f4xx_hash.c
    src/peripherals/stm32f4xx_syscfg.c
    src/peripherals/stm32f4xx_cryp_des.c
    src/peripherals/stm32f4xx_hash_md5.c
    src/peripherals/stm32f4xx_tim.c
    src/peripherals/stm32f4xx_cryp_tdes.c
    src/peripherals/stm32f4xx_hash_sha1.c 
    src/peripherals/stm32f4xx_usart.c 
    src/peripherals/stm32f4xx_dac.c
    src/peripherals/stm32f4xx_i2c.c
    src/peripherals/stm32f4xx_wwdg.c
    src/peripherals/stm32f4xx_dbgmcu.c
    src/peripherals/stm32f4xx_iwdg.c
    src/peripherals/stm32f4xx_dcmi.c 
    src/peripherals/stm32f4xx_pwr.c)

add_library(stm32f4  ${LIB_SRC_LIST})

