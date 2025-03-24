@echo off
setlocal
:: flash
set PATH=C:\dnload\embedded-etc\openocd-v0.12.0\bin;%PATH%

:: TODO: add "nrf51 mass_erase"
openocd -f openocd.cfg -c "init" -c "halt" -c "program try.hex verify reset exit"

