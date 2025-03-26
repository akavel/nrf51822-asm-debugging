#![no_std]
#![no_main]

// pick a panicking behavior
use panic_halt as _; // you can put a breakpoint on `rust_begin_unwind` to catch panics
// use panic_abort as _; // requires nightly
// use panic_itm as _; // logs messages over ITM; requires ITM support
// use panic_semihosting as _; // logs messages to the host stderr; requires a debugger

use cortex_m::asm;
use cortex_m_rt::entry;
use nrf51_hal::{self as hal, gpio::Level};
use embedded_hal::digital::OutputPin;

#[entry]
fn main() -> ! {
    // asm::nop(); // To not have main optimize to abort in release mode, remove when you add code
    let p = hal::pac::Peripherals::take().unwrap();
    let gpio = hal::gpio::p0::Parts::new(p.GPIO);  // TODO: what's this?
    let mut led = gpio.p0_18.into_push_pull_output(Level::High);
    let mut timer = hal::timer::Timer::new(p.TIMER0);

    // const DELAY: u32 = 800_000;
    const DELAY: u32 = 800;
    loop {
        // your code goes here
        asm::nop();
        let _ = led.set_high();

        timer.delay(DELAY);

        asm::nop();
        let _ = led.set_low();

        timer.delay(DELAY);
    }
}
