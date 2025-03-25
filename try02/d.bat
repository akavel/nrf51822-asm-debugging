@echo off
setlocal
:: disassemble
:: NOTE: requires: `cargo install cargo-binutils`

:: -l = --line-numbers
cargo objdump --release -- --disassemble --no-show-raw-insn %*

