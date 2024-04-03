################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../app.c \
../app_peripherals.c \
../main.c 

OBJS += \
./app.o \
./app_peripherals.o \
./main.o 

C_DEPS += \
./app.d \
./app_peripherals.d \
./main.d 


# Each subdirectory must supply rules for building sources it contributes
app.o: ../app.c subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG_EFM=1' '-DEFM32PG28B310F1024IM68=1' '-DHFXO_FREQ=39000000' '-DSL_BOARD_NAME="BRD2506A"' '-DSL_BOARD_REV="A03"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Pingpong\gecko_sdk_4.4.1\platform\emdrv\dmadrv\src_inc" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Pingpong\config" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Pingpong\autogen" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Pingpong" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG28/Include" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/configuration_over_swo/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/driver/debug/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/dmadrv/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/common/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -O3 -Wall -Wextra -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"app.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

app_peripherals.o: ../app_peripherals.c subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG_EFM=1' '-DEFM32PG28B310F1024IM68=1' '-DHFXO_FREQ=39000000' '-DSL_BOARD_NAME="BRD2506A"' '-DSL_BOARD_REV="A03"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Pingpong\gecko_sdk_4.4.1\platform\emdrv\dmadrv\src_inc" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Pingpong\config" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Pingpong\autogen" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Pingpong" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG28/Include" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/configuration_over_swo/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/driver/debug/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/dmadrv/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/common/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -O3 -Wall -Wextra -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"app_peripherals.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

main.o: ../main.c subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG_EFM=1' '-DEFM32PG28B310F1024IM68=1' '-DHFXO_FREQ=39000000' '-DSL_BOARD_NAME="BRD2506A"' '-DSL_BOARD_REV="A03"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Pingpong\gecko_sdk_4.4.1\platform\emdrv\dmadrv\src_inc" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Pingpong\config" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Pingpong\autogen" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Pingpong" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG28/Include" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/configuration_over_swo/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/driver/debug/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/dmadrv/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/common/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -O3 -Wall -Wextra -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"main.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


