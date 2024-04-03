################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk/platform/common/toolchain/src/sl_memory.c 

OBJS += \
./gecko_sdk_4.4.1/platform/common/toolchain/src/sl_memory.o 

C_DEPS += \
./gecko_sdk_4.4.1/platform/common/toolchain/src/sl_memory.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.1/platform/common/toolchain/src/sl_memory.o: C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk/platform/common/toolchain/src/sl_memory.c gecko_sdk_4.4.1/platform/common/toolchain/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG_EFM=1' '-DEFM32PG28B310F1024IM68=1' '-DHFXO_FREQ=39000000' '-DSL_BOARD_NAME="BRD2506A"' '-DSL_BOARD_REV="A03"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Lowpower\gecko_sdk_4.4.1\platform\emdrv\dmadrv\src_inc" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Lowpower\config" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Lowpower\autogen" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Lowpower" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG28/Include" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/configuration_over_swo/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/driver/debug/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/dmadrv/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/common/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/peripheral/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/sleeptimer/inc" -O3 -Wall -Wextra -fshort-enums -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.1/platform/common/toolchain/src/sl_memory.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


