@echo off
setlocal
:: flash
set PATH=C:\users\Mateusz\AppData\local\Arduino15\packages\sandeepmistry\tools\gcc-arm-none-eabi\5_2-2015q4\bin;%PATH%

openocd -f openocd.cfg -c "init" -c "program try.hex verify reset exit"

