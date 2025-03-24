
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

	sub r2,r1,r0

	ldr r1, =_flash_dstart

cpy_loop:
	ldrb r3, [r1]
	strb r3, [r0]

	add r1, r1, #1
	add r0, r0, #1

	sub r2, r2, #1
	cmp r2, #0
	bne cpy_loop


main:
	ldr r9, =apa
	ldr r9, [r9]

	ldr r7, =0xF00DF00D
	ldr r8, =0x1337BEEF

done:
	b done

	.section .data

apa:	.word 0xFEEBDAED
