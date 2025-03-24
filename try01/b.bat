@echo off
setlocal
:: build
set PATH=C:\users\Mateusz\AppData\local\Arduino15\packages\sandeepmistry\tools\gcc-arm-none-eabi\5_2-2015q4\bin;%PATH%

arm-none-eabi-as -g -mcpu=cortex-m0 -mthumb try.s -o try.o
arm-none-eabi-ld try.o -T ./try.ld -o try.elf
arm-none-eabi-objcopy -O ihex try.elf try.hex

