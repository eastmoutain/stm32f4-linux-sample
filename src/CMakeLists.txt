include_directories(${PROJECT_SOURCE_DIR}/inc)
include_directories(${PROJECT_SOURCE_DIR}/lib)
include_directories(${PROJECT_SOURCE_DIR}/lib/inc)
include_directories(${PROJECT_SOURCE_DIR}/lib/inc/peripherals)
include_directories(${PROJECT_SOURCE_DIR}/lib/inc/core)


              
set(SRC_LIST
    main.c
    stm32f4xx_it.c
    #syscalls.c
    #utils.c 
    system_stm32f4xx.c
    )

add_executable(${proj_name}.elf ${SRC_LIST})

target_link_libraries(${proj_name}.elf stm32f4)

################### build hex file ######################
add_custom_target(${proj_name}.hex
                 ALL
                 DEPENDS ${proj_name}.elf
                 COMMAND ${CMAKE_OBJCOPY} -Oihex ${proj_name}.elf ${proj_name}.hex
                 WORKING_DIRECTORY ${EXECUTABLE_OUTPUT_PATH}
                 COMMENT "building  ${proj_name}.hex")
                
################### build bin file #####################
add_custom_target(${proj_name}.bin
                  ALL
                  DEPENDS ${proj_name}.elf
                  COMMAND ${CMAKE_OBJCOPY} -Obinary ${proj_name}.elf ${proj_name}.bin
                  WORKING_DIRECTORY ${EXECUTABLE_OUTPUT_PATH}
                  COMMENT "building ${proj_name}.bin")

################## display ELF info #####################
add_custom_target(objsize
                  ALL
                  DEPENDS ${proj_name}.elf
                  COMMAND ${CMAKE_OBJSIZE} -t -x ${proj_name}.elf
                  WORKING_DIRECTORY ${EXECUTABLE_OUTPUT_PATH})

################## copy .gdbinit file to output path ###################
add_custom_target(gdbinit
                  ALL
                  COMMAND cp ${PROJECT_SOURCE_DIR}/.gdbinit ${CMAKE_BINARY_DIR}/bin
                  COMMENT "copying ${PROJECT_SOURCE_DIR}/.gdbinit to ${CMAKE_BINARY_DIR}/bin/.gdbinit")

################# flash the binary to the board ####################
add_custom_target(burn
                  COMMAND st-flash write ${proj_name}.bin 0x8000000
                  COMMENT "uploading ${proj_name}.bin to 0x8000000"
                  WORKING_DIRECTORY ${EXECUTABLE_OUTPUT_PATH})

