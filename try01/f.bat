@echo off
:: flash

openocd -f openocd.cfg -c "init" -c "program try.hex verify reset exit"

