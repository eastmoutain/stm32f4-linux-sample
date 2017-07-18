cmake_minimum_required(VERSION 3.5)

project(stm32f4 ASM C CXX)

set(proj_name "stm32_test")

set(CMAKE_VERBOSE_MAKEFILE on)
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
set(CMAKE_ASM_COMPILER arm-none-eabi-as)
set(CMAKE_AR arm-none-eabi-ar)
set(CMAKE_LD arm-none-eabi-ld)
set(CMAKE_LINKER arm-none-eabi-ld)
set(CMAKE_RANLIB arm-none-eabi-ranlib)
set(CMAKE_OBJCOPY arm-none-eabi-objcopy)
set(CMAKE_OBJSIZE arm-none-eabi-size)

message("CMAKE_C_COMPILER ${CMAKE_C_COMPILER}")
message("CMAKE_CXX_COMPILER ${CMAKE_CXX_COMPILER}")
message("CMAKE_ASM_COMPILER ${CMAKE_ASM_COMPILER}")

# enable_language(ASM) # enabled by project(XXX ASM C CXX)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

link_directories(${CMAKE_LIBRARY_OUTPUT_DIRECTORY})

set(FLOAT_FLAGS "-fsingle-precision-constant -Wdouble-promotion -mfpu=fpv4-sp-d16 -mfloat-abi=hard")


set(CMAKE_C_FLAGS "-g -O2 -Wall -std=c99  -mlittle-endian -mthumb -mthumb-interwork -mcpu=cortex-m4 -ffreestanding ${FLOAT_FLAGS}"
    )

message("CMAKE_C_FLAGS ${CMAKE_C_FLAGS}")

set(CMAKE_CXX_FLAGS ${CMAKE_C_FLAGS})
message("CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS}")

set(CMAKE_ASM_FLAGS "-mthumb -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard")

#set(CMAKE_EXE_LINKER_FLAGS "-nostartfiles -Wl,--gc-sections -mthumb -mcpu=cortex-m4")
set(CMAKE_EXE_LINKER_FLAGS " -Wl,--gc-sections -mthumb -mcpu=cortex-m4 -T${PROJECT_SOURCE_DIR}/stm32_flash.ld")

message("CMAKE_EXE_LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS}")



add_subdirectory(${PROJECT_SOURCE_DIR}/lib)
add_subdirectory(${PROJECT_SOURCE_DIR}/src)
