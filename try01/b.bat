@echo off
:: build

arm-none-eabi-as -g -mcpu=cortex-m0 -mthumb try.s -o try.o
arm-none-eabi-ld try.o -T ./try.ld -o try.elf
arm-none-eabi-objcopy -O ihex try.elf try.hex

