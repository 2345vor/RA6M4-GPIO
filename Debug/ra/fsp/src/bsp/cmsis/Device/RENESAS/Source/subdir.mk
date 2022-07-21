################################################################################
# �Զ����ɵ��ļ�����Ҫ�༭��
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ra/fsp/src/bsp/cmsis/Device/RENESAS/Source/startup.c \
../ra/fsp/src/bsp/cmsis/Device/RENESAS/Source/system.c 

OBJS += \
./ra/fsp/src/bsp/cmsis/Device/RENESAS/Source/startup.o \
./ra/fsp/src/bsp/cmsis/Device/RENESAS/Source/system.o 

C_DEPS += \
./ra/fsp/src/bsp/cmsis/Device/RENESAS/Source/startup.d \
./ra/fsp/src/bsp/cmsis/Device/RENESAS/Source/system.d 


# Each subdirectory must supply rules for building sources it contributes
ra/fsp/src/bsp/cmsis/Device/RENESAS/Source/%.o: ../ra/fsp/src/bsp/cmsis/Device/RENESAS/Source/%.c
	arm-none-eabi-gcc -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\board\ports" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\board" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\libraries\HAL_Drivers\config" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\libraries\HAL_Drivers" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\ra\arm\CMSIS_5\CMSIS\Core\Include" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\ra\fsp\inc\api" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\ra\fsp\inc\instances" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\ra\fsp\inc" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\ra_cfg\fsp_cfg\bsp" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\ra_cfg\fsp_cfg" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\ra_gen" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\rt-thread\components\drivers\include" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\rt-thread\components\finsh" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\rt-thread\components\libc\compilers\common" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\rt-thread\components\libc\compilers\newlib" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\rt-thread\components\libc\posix\io\poll" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\rt-thread\components\libc\posix\io\stdio" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\rt-thread\components\libc\posix\ipc" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\rt-thread\include" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\rt-thread\libcpu\arm\common" -I"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\rt-thread\libcpu\arm\cortex-m4" -include"D:\RT-ThreadStudio\workspace\RA6M4-GPIO\rtconfig_preinc.h" -std=gnu11 -mcpu=cortex-m33 -mthumb -mfpu=fpv5-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -Dgcc -O0 -gdwarf-2 -g -Wall -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

