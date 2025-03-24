@echo off
setlocal
:: disassemble
set PATH=C:\users\Mateusz\AppData\local\Arduino15\packages\sandeepmistry\tools\gcc-arm-none-eabi\5_2-2015q4\bin;%PATH%

arm-none-eabi-objdump -s -d try.elf

