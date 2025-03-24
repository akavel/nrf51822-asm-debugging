
	.syntax unified
	.cpu cortex-m0
	.thumb

	.global vtable
	.global reset_handler

	.section .text

vtable:
	.word _estack
	.word reset_handler
	.word 0
	.word hardfault_handler
	@ .size vtable, .-vtable

.thumb_func	
hardfault_handler:
	b hardfault_handler
	
.thumb_func	
reset_handler:
	ldr r0, =_estack
	mov sp, r0

	ldr r0, =_dstart
	ldr r1, =_dend

	subs r2,r1,r0
	cmp r2, #0
	beq main

	ldr r1, =_flash_dstart

cpy_loop:
	ldrb r3, [r1]
	strb r3, [r0]

	adds r1, r1, #1
	adds r0, r0, #1

	subs r2, r2, #1
	cmp r2, #0
	bne cpy_loop


main:

.equiv GPIO, 0x50000000
.equiv OUTSET, GPIO + 0x508
.equiv OUTCLR, GPIO + 0x50c
.equiv DIRSET, GPIO + 0x518
.equiv PIN_21, 1 << 21

	// set pin 21 as out
	ldr r0, =PIN_21
	ldr r1, =DIRSET
	str r0, [r1]		// can I simplify this?

forever:
	// enable LED r0 (set as high)
	ldr r1, =OUTSET
	str r0, [r1]

	ldr r2, =1000000
	bl delay

	// disable LED r0 (set as low)
	ldr r1, =OUTCLR
	str r0, [r1]

	ldr r2, =1000000
	bl delay
	
	b forever

delay: // delay r2 (cycles)
	cmp r2, #0		// are we done yet?
	beq delay_done	// if yes, jump out
	subs r2, r2, #1 // else, dec counter
	b delay			// loop
delay_done:
	bx lr			// return from function call

	.section .data


