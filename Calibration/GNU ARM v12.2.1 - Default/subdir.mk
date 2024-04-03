################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../app.c \
../main.c 

OBJS += \
./app.o \
./main.o 

C_DEPS += \
./app.d \
./main.d 


# Each subdirectory must supply rules for building sources it contributes
app.o: ../app.c subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG_EFM=1' '-DEFM32PG28B310F1024IM68=1' '-DHFXO_FREQ=39000000' '-DSL_BOARD_NAME="BRD2506A"' '-DSL_BOARD_REV="A03"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Demo_FastVer\gecko_sdk_4.4.0\platform\emlib\inc" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Demo_FastVer\gecko_sdk_4.4.0\platform\Device\SiliconLabs\EFM32PG28\Include" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Demo_FastVer\gecko_sdk_4.4.0\platform\emdrv\dmadrv\src_inc" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Demo_FastVer\config" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Demo_FastVer\autogen" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Demo_FastVer" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG28/Include" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/configuration_over_swo/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/driver/debug/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/dmadrv/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/common/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -Os -Wall -Wextra -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"app.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

main.o: ../main.c subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG_EFM=1' '-DEFM32PG28B310F1024IM68=1' '-DHFXO_FREQ=39000000' '-DSL_BOARD_NAME="BRD2506A"' '-DSL_BOARD_REV="A03"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Demo_FastVer\gecko_sdk_4.4.0\platform\emlib\inc" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Demo_FastVer\gecko_sdk_4.4.0\platform\Device\SiliconLabs\EFM32PG28\Include" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Demo_FastVer\gecko_sdk_4.4.0\platform\emdrv\dmadrv\src_inc" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Demo_FastVer\config" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Demo_FastVer\autogen" -I"C:\Users\Abilash\SimplicityStudio\v5_workspace\Demo_FastVer" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG28/Include" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/configuration_over_swo/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/driver/debug/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/dmadrv/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/common/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/Abilash/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -Os -Wall -Wextra -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"main.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

