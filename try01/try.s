
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
	ldr r4, =apa
	ldr r4, [r4]

	ldr r5, =0xF00DF00D
	ldr r6, =0x1337BEEF

done:
	b done

	.section .data

apa:	.word 0xFEEBDAED

