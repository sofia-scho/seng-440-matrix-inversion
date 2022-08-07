	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main_with_hardware.c"
	.global	__aeabi_idiv
	.text
	.align	2
	.global	scale_up
	.type	scale_up, %function
scale_up:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	subs	r4, r2, #0
	mov	r5, r1
	movgt	r1, #0
	movgt	ip, r1
	ble	.L14
.L3:
	mov	r2, #0
.L4:
	ldr	r3, [r0, r2, asl #2]
	add	r2, r2, #1
	cmp	r1, r3
	movlt	r1, r3
	cmp	r4, r2
	bgt	.L4
	add	ip, ip, #1
	cmp	r4, ip
	add	r0, r0, #24
	bgt	.L3
	mov	r0, #16777216
	bl	__aeabi_idiv
	mov	r1, r5
	mov	lr, #0
.L7:
	mov	ip, #0
	mov	r2, ip
.L6:
	add	ip, ip, #1
	cmp	r4, ip
	ldr	r3, [r1, r2]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r3, r0, r3
	
@ 0 "" 2
	str	r3, [r1, r2]
	add	r2, r2, #4
	bgt	.L6
	add	lr, lr, #1
	cmp	r4, lr
	add	r1, r1, #24
	bgt	.L7
.L8:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L14:
	mov	r1, #0
	mov	r0, #16777216
	bl	__aeabi_idiv
	b	.L8
	.size	scale_up, .-scale_up
	.align	2
	.global	calculate_condition_number
	.type	calculate_condition_number, %function
calculate_condition_number:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	cmp	r1, #0
	movgt	r4, r0
	movle	r4, #0
	movgt	r5, #0
	sub	sp, sp, #144
	movle	r5, r4
	movgt	lr, r4
	movgt	r0, r5
	ble	.L17
.L18:
	mov	r2, #0
	mov	ip, r2
.L21:
	ldr	r3, [lr, r2, asl #2]
	add	r2, r2, #1
	cmp	r3, #0
	rsblt	ip, r3, ip
	addge	ip, ip, r3
	cmp	r1, r2
	bgt	.L21
	add	r0, r0, #1
	cmp	r5, ip
	movlt	r5, ip
	cmp	r1, r0
	add	lr, lr, #24
	bgt	.L18
	mov	lr, #0
	mov	r6, sp
	mov	r0, r1, asl #2
.L25:
	mov	r3, lr, asl #5
	sub	r3, r3, lr, asl #3
	add	ip, r6, r3
	mov	r2, #0
.L24:
	ldr	r3, [r4, r2]
	add	r2, r2, #4
	add	r3, r3, #50
	cmp	r2, r0
	str	r3, [ip], #4
	bne	.L24
	add	lr, lr, #1
	cmp	r1, lr
	add	r4, r4, #24
	bgt	.L25
	mov	r4, #0
	mov	r0, r4
.L30:
	mov	r3, r0, asl #5
	sub	r3, r3, r0, asl #3
	mov	r2, #0
	add	lr, r6, r3
	mov	ip, r2
.L28:
	ldr	r3, [lr], #4
	add	r2, r2, #1
	cmp	r3, #0
	rsblt	ip, r3, ip
	addge	ip, ip, r3
	cmp	r1, r2
	bgt	.L28
	add	r0, r0, #1
	cmp	r4, ip
	movlt	r4, ip
	cmp	r1, r0
	bgt	.L30
.L17:
	mov	r1, r5
	mov	r0, r4
	bl	__aeabi_idiv
	mov	r1, r0
	mov	r0, #125
	bl	__aeabi_idiv
	add	sp, sp, #144
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
	.size	calculate_condition_number, .-calculate_condition_number
	.align	2
	.global	hardware_multiplier
	.type	hardware_multiplier, %function
hardware_multiplier:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
#APP
@ 385 "main_with_hardware.c" 1
	hmul r1, r1, r0
	
@ 0 "" 2
	mov	r0, r1
	bx	lr
	.size	hardware_multiplier, .-hardware_multiplier
	.align	2
	.global	print_matrix
	.type	print_matrix, %function
print_matrix:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	subs	r7, r1, #0
	movgt	r5, r0
	movgt	r6, #0
	ble	.L40
.L41:
	mov	r4, #0
.L42:
	ldr	r1, [r5, r4, asl #2]
	ldr	r0, .L45
	add	r4, r4, #1
	bl	printf
	cmp	r7, r4
	bgt	.L42
	add	r6, r6, #1
	mov	r0, #10
	bl	putchar
	cmp	r7, r6
	add	r5, r5, #24
	bgt	.L41
.L40:
	mov	r0, #10
	bl	putchar
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LC0
	.size	print_matrix, .-print_matrix
	.align	2
	.global	invert_matrix
	.type	invert_matrix, %function
invert_matrix:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	subs	r9, r2, #0
	sub	sp, sp, #28
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	ble	.L55
	mov	fp, #0
	str	r1, [sp, #20]
	str	r0, [sp, #16]
	str	fp, [sp, #12]
.L54:
	ldr	r3, [sp, #8]
	ldr	r2, [sp, #12]
	ldr	r6, [r3, r2]
	cmp	r6, #0
	beq	.L60
	ldr	r5, [sp, #16]
	ldr	r4, [sp, #20]
	mov	r7, #0
.L50:
	ldr	r0, [r5, #0]
	mov	r1, r6
	bl	__aeabi_idiv
	str	r0, [r5, #0]
	mov	r1, r6
	ldr	r0, [r4, #0]
	bl	__aeabi_idiv
	str	r0, [r4, #0]
	mov	r1, r6
	ldr	r0, [r5, #4]
	bl	__aeabi_idiv
	str	r0, [r5, #4]
	mov	r1, r6
	ldr	r0, [r4, #4]
	bl	__aeabi_idiv
	add	r7, r7, #2
	cmp	r9, r7
	str	r0, [r4, #4]
	add	r5, r5, #8
	add	r4, r4, #8
	bgt	.L50
	ldr	r2, [sp, #8]
	mov	r3, fp, asl #2
	mov	r7, #0
	add	sl, r2, r3
	mov	r8, r7
.L53:
	cmp	r7, fp
	ldr	r5, [sl, #0]
	beq	.L51
	ldmib	sp, {r2, r3}	@ phole ldm
	add	r4, sp, #16
	ldmia	r4, {r4, lr}	@ phole ldm
	add	ip, r3, r8
	add	r0, r2, r8
	mov	r6, #0
.L52:
	ldr	r2, [ip, #0]
	ldr	r3, [r4, #0]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r3, r5, r3
	
@ 0 "" 2
	rsb	r2, r3, r2
	str	r2, [ip, #0]
	ldr	r1, [r0, #0]
	ldr	r3, [lr, #0]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r3, r5, r3
	
@ 0 "" 2
	rsb	r1, r3, r1
	str	r1, [r0, #0]
	ldr	r2, [ip, #4]
	ldr	r3, [r4, #4]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r3, r5, r3
	
@ 0 "" 2
	rsb	r2, r3, r2
	str	r2, [ip, #4]
	ldr	r1, [r0, #4]
	add	r6, r6, #2
	ldr	r3, [lr, #4]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r3, r5, r3
	
@ 0 "" 2
	cmp	r9, r6
	rsb	r1, r3, r1
	str	r1, [r0, #4]
	add	ip, ip, #8
	add	r4, r4, #8
	add	r0, r0, #8
	add	lr, lr, #8
	bgt	.L52
.L51:
	add	r7, r7, #1
	cmp	r9, r7
	add	sl, sl, #24
	add	r8, r8, #24
	bgt	.L53
	ldr	r3, [sp, #12]
	add	r3, r3, #28
	ldr	r2, [sp, #20]
	str	r3, [sp, #12]
	ldr	r3, [sp, #16]
	add	fp, fp, #1
	add	r2, r2, #24
	add	r3, r3, #24
	cmp	r9, fp
	str	r2, [sp, #20]
	str	r3, [sp, #16]
	bgt	.L54
.L55:
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L60:
	ldr	r0, .L61
	bl	puts
	b	.L55
.L62:
	.align	2
.L61:
	.word	.LC1
	.size	invert_matrix, .-invert_matrix
	.global	__aeabi_i2d
	.global	__aeabi_ddiv
	.global	__aeabi_dmul
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #156
	bl	clock
	mov	r1, r0
	str	r0, [sp, #4]
	ldr	r0, .L146
	bl	printf
	ldr	r0, .L146+4
	bl	puts
	ldr	sl, .L146+8
	mov	r7, sl
	add	r4, sl, #144
.L64:
	ldr	r1, [r7, #0]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r7, #4]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r7, #8]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r7, #12]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r7, #16]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r7, #20]
	ldr	r0, .L146+12
	bl	printf
	add	r7, r7, #24
	mov	r0, #10
	bl	putchar
	cmp	r7, r4
	bne	.L64
	mov	r0, #10
	bl	putchar
	sub	ip, r7, #144
	mov	lr, #0
.L65:
	ldmia	ip, {r2, r3}	@ phole ldm
	ldr	r1, [ip, #8]
	cmp	r3, r2
	movlt	r3, r2
	ldr	r0, [ip, #12]
	cmp	r3, r1
	movlt	r3, r1
	ldr	r2, [ip, #16]
	cmp	r3, r0
	movlt	r3, r0
	cmp	r3, r2
	movlt	r3, r2
	ldr	r1, [ip, #20]
	cmp	r3, lr
	movlt	r3, lr
	add	ip, ip, #24
	cmp	r3, r1
	movge	lr, r3
	movlt	lr, r1
	cmp	ip, r7
	bne	.L65
	mov	r1, lr
	mov	r0, #16777216
	bl	__aeabi_idiv
	ldr	r8, .L146+16
	mov	r9, r0
	mov	r5, r8
	add	r1, r8, #144
.L66:
	ldr	r3, [r5, #0]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r3, r9, r3
	
@ 0 "" 2
	ldr	r2, [r5, #4]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r2, r9, r2
	
@ 0 "" 2
	str	r3, [r5, #0]
	str	r2, [r5, #4]
	ldr	r3, [r5, #8]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r3, r9, r3
	
@ 0 "" 2
	ldr	r2, [r5, #12]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r2, r9, r2
	
@ 0 "" 2
	str	r3, [r5, #8]
	str	r2, [r5, #12]
	ldr	r3, [r5, #16]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r3, r9, r3
	
@ 0 "" 2
	ldr	r2, [r5, #20]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r2, r9, r2
	
@ 0 "" 2
	str	r3, [r5, #16]
	str	r2, [r5, #20]
	add	r5, r5, #24
	cmp	r5, r1
	bne	.L66
	sub	lr, r5, #288
	mov	fp, #0
.L79:
	ldr	r3, [lr, #0]
	ldr	r2, [lr, #4]
	ldr	r1, [lr, #8]
	cmp	r3, #0
	rsblt	r3, r3, #0
	ldr	r0, [lr, #12]
	cmp	r2, #0
	rsblt	r3, r2, r3
	addge	r3, r3, r2
	ldr	ip, [lr, #16]
	cmp	r1, #0
	rsblt	r3, r1, r3
	addge	r3, r3, r1
	ldr	r2, [lr, #20]
	cmp	r0, #0
	rsblt	r3, r0, r3
	addge	r3, r3, r0
	cmp	ip, #0
	rsblt	r3, ip, r3
	addge	r3, r3, ip
	cmp	r2, #0
	rsblt	r3, r2, r3
	addge	r3, r2, r3
	add	lr, lr, #24
	cmp	fp, r3
	movlt	fp, r3
	cmp	lr, r7
	bne	.L79
	add	r6, sp, #8
	mov	r4, r6
.L80:
	ldr	r3, [sl, #0]
	ldr	r2, [sl, #4]
	ldr	r1, [sl, #8]
	add	r0, sl, #12
	ldmia	r0, {r0, ip, lr}	@ phole ldm
	add	sl, sl, #24
	add	r3, r3, #50
	add	r2, r2, #50
	add	r1, r1, #50
	add	r0, r0, #50
	add	ip, ip, #50
	add	lr, lr, #50
	cmp	sl, r7
	str	r3, [r4, #0]
	str	r2, [r4, #4]
	str	r1, [r4, #8]
	str	r0, [r4, #12]
	str	ip, [r4, #16]
	str	lr, [r4, #20]
	add	r4, r4, #24
	bne	.L80
	mov	lr, #0
.L93:
	ldr	r3, [r6, #0]
	ldr	r2, [r6, #4]
	ldr	r1, [r6, #8]
	cmp	r3, #0
	rsblt	r3, r3, #0
	ldr	r0, [r6, #12]
	cmp	r2, #0
	rsblt	r3, r2, r3
	addge	r3, r3, r2
	ldr	ip, [r6, #16]
	cmp	r1, #0
	rsblt	r3, r1, r3
	addge	r3, r3, r1
	ldr	r2, [r6, #20]
	cmp	r0, #0
	rsblt	r3, r0, r3
	addge	r3, r3, r0
	cmp	ip, #0
	rsblt	r3, ip, r3
	addge	r3, r3, ip
	cmp	r2, #0
	rsblt	r3, r2, r3
	addge	r3, r2, r3
	cmp	lr, r3
	movlt	lr, r3
	add	r6, r6, #24
	add	r3, sp, #152
	cmp	r6, r3
	bne	.L93
	mov	r1, fp
	mov	r0, lr
	bl	__aeabi_idiv
	mov	r1, r0
	mov	r0, #125
	bl	__aeabi_idiv
	cmp	r0, #10
	ble	.L94
	mov	r1, r0
	ldr	r0, .L146+20
	bl	printf
.L95:
	ldr	r0, .L146+8
	mov	r2, #6
	add	r1, r0, #144
	mov	r3, r9
	bl	invert_matrix
.L96:
	ldr	r1, [r8, #0]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r8, #4]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r8, #8]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r8, #12]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r8, #16]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r8, #20]
	ldr	r0, .L146+12
	bl	printf
	add	r8, r8, #24
	mov	r0, #10
	bl	putchar
	cmp	r8, r5
	bne	.L96
	mov	r0, #10
	bl	putchar
	mov	r1, r9
	ldr	r0, .L146+24
	bl	printf
	ldr	r0, .L146+28
	bl	puts
	ldr	sl, .L146+32
	mov	r7, sl
	add	r4, sl, #144
.L97:
	ldr	r1, [r7, #0]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r7, #4]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r7, #8]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r7, #12]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r7, #16]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r7, #20]
	ldr	r0, .L146+12
	bl	printf
	add	r7, r7, #24
	mov	r0, #10
	bl	putchar
	cmp	r7, r4
	bne	.L97
	mov	r0, #10
	bl	putchar
	sub	ip, r7, #144
	mov	lr, #0
.L98:
	ldmia	ip, {r2, r3}	@ phole ldm
	ldr	r1, [ip, #8]
	cmp	r3, r2
	movlt	r3, r2
	ldr	r0, [ip, #12]
	cmp	r3, r1
	movlt	r3, r1
	ldr	r2, [ip, #16]
	cmp	r3, r0
	movlt	r3, r0
	cmp	r3, r2
	movlt	r3, r2
	ldr	r1, [ip, #20]
	cmp	r3, lr
	movlt	r3, lr
	add	ip, ip, #24
	cmp	r3, r1
	movge	lr, r3
	movlt	lr, r1
	cmp	ip, r7
	bne	.L98
	mov	r1, lr
	mov	r0, #16777216
	bl	__aeabi_idiv
	ldr	r8, .L146+36
	mov	r9, r0
	mov	r5, r8
	add	r1, r8, #144
.L99:
	ldr	r3, [r5, #0]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r3, r9, r3
	
@ 0 "" 2
	ldr	r2, [r5, #4]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r2, r9, r2
	
@ 0 "" 2
	str	r3, [r5, #0]
	str	r2, [r5, #4]
	ldr	r3, [r5, #8]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r3, r9, r3
	
@ 0 "" 2
	ldr	r2, [r5, #12]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r2, r9, r2
	
@ 0 "" 2
	str	r3, [r5, #8]
	str	r2, [r5, #12]
	ldr	r3, [r5, #16]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r3, r9, r3
	
@ 0 "" 2
	ldr	r2, [r5, #20]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r2, r9, r2
	
@ 0 "" 2
	str	r3, [r5, #16]
	str	r2, [r5, #20]
	add	r5, r5, #24
	cmp	r5, r1
	bne	.L99
	sub	lr, r5, #288
	mov	fp, #0
.L112:
	ldr	r3, [lr, #0]
	ldr	r2, [lr, #4]
	ldr	r1, [lr, #8]
	cmp	r3, #0
	rsblt	r3, r3, #0
	ldr	r0, [lr, #12]
	cmp	r2, #0
	rsblt	r3, r2, r3
	addge	r3, r3, r2
	ldr	ip, [lr, #16]
	cmp	r1, #0
	rsblt	r3, r1, r3
	addge	r3, r3, r1
	ldr	r2, [lr, #20]
	cmp	r0, #0
	rsblt	r3, r0, r3
	addge	r3, r3, r0
	cmp	ip, #0
	rsblt	r3, ip, r3
	addge	r3, r3, ip
	cmp	r2, #0
	rsblt	r3, r2, r3
	addge	r3, r2, r3
	add	lr, lr, #24
	cmp	fp, r3
	movlt	fp, r3
	cmp	lr, r7
	bne	.L112
	add	r6, sp, #8
	mov	r4, r6
.L113:
	ldr	r3, [sl, #0]
	ldr	r2, [sl, #4]
	ldr	r1, [sl, #8]
	add	r0, sl, #12
	ldmia	r0, {r0, ip, lr}	@ phole ldm
	add	sl, sl, #24
	add	r3, r3, #50
	add	r2, r2, #50
	add	r1, r1, #50
	add	r0, r0, #50
	add	ip, ip, #50
	add	lr, lr, #50
	cmp	sl, r7
	str	r3, [r4, #0]
	str	r2, [r4, #4]
	str	r1, [r4, #8]
	str	r0, [r4, #12]
	str	ip, [r4, #16]
	str	lr, [r4, #20]
	add	r4, r4, #24
	bne	.L113
	mov	lr, #0
.L126:
	ldr	r3, [r6, #0]
	ldr	r2, [r6, #4]
	ldr	r1, [r6, #8]
	cmp	r3, #0
	rsblt	r3, r3, #0
	ldr	r0, [r6, #12]
	cmp	r2, #0
	rsblt	r3, r2, r3
	addge	r3, r3, r2
	ldr	ip, [r6, #16]
	cmp	r1, #0
	rsblt	r3, r1, r3
	addge	r3, r3, r1
	ldr	r2, [r6, #20]
	cmp	r0, #0
	rsblt	r3, r0, r3
	addge	r3, r3, r0
	cmp	ip, #0
	rsblt	r3, ip, r3
	addge	r3, r3, ip
	cmp	r2, #0
	rsblt	r3, r2, r3
	addge	r3, r2, r3
	cmp	lr, r3
	movlt	lr, r3
	add	r6, r6, #24
	add	r3, sp, #152
	cmp	r6, r3
	bne	.L126
	mov	r1, fp
	mov	r0, lr
	bl	__aeabi_idiv
	mov	r1, r0
	mov	r0, #125
	bl	__aeabi_idiv
	cmp	r0, #10
	bgt	.L145
	mov	r1, r0
	ldr	r0, .L146+40
	bl	printf
.L128:
	ldr	r0, .L146+32
	mov	r2, #6
	add	r1, r0, #144
	mov	r3, r9
	bl	invert_matrix
.L129:
	ldr	r1, [r8, #0]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r8, #4]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r8, #8]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r8, #12]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r8, #16]
	ldr	r0, .L146+12
	bl	printf
	ldr	r1, [r8, #20]
	ldr	r0, .L146+12
	bl	printf
	add	r8, r8, #24
	mov	r0, #10
	bl	putchar
	cmp	r5, r8
	bne	.L129
	mov	r0, #10
	bl	putchar
	mov	r1, r9
	ldr	r0, .L146+24
	bl	printf
	bl	clock
	mov	r4, r0
	mov	r1, r0
	ldr	r0, .L146+44
	bl	printf
	ldr	r3, [sp, #4]
	rsb	r0, r3, r4
	bl	__aeabi_i2d
	mov	r3, #1090519040
	add	r3, r3, #3047424
	mov	r2, #0
	add	r3, r3, #1152
	bl	__aeabi_ddiv
	mov	r2, #0
	ldr	r3, .L146+48
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L146+52
	bl	printf
	mov	r0, #0
	add	sp, sp, #156
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L94:
	mov	r1, r0
	ldr	r0, .L146+40
	bl	printf
	b	.L95
.L145:
	mov	r1, r0
	ldr	r0, .L146+20
	bl	printf
	b	.L128
.L147:
	.align	2
.L146:
	.word	.LC2
	.word	.LC3
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR0+144
	.word	.LC4
	.word	.LC6
	.word	.LC7
	.word	.LANCHOR0+288
	.word	.LANCHOR0+432
	.word	.LC5
	.word	.LC8
	.word	1102567300
	.word	.LC9
	.size	main, .-main
	.global	well_conditioned_matrix
	.global	well_conditioned_inversion_result
	.global	ill_conditioned_matrix
	.global	ill_conditioned_inversion_result
	.data
	.align	2
.LANCHOR0 = . + 0
	.type	ill_conditioned_matrix, %object
	.size	ill_conditioned_matrix, 144
ill_conditioned_matrix:
	.word	1
	.word	2
	.word	1
	.word	1
	.word	2
	.word	1
	.word	5
	.word	33
	.word	7
	.word	1
	.word	1
	.word	3
	.word	7
	.word	1
	.word	1
	.word	4
	.word	1
	.word	2
	.word	1
	.word	1
	.word	5
	.word	2
	.word	3
	.word	7
	.word	1
	.word	2
	.word	5
	.word	50
	.word	2
	.word	1
	.word	1
	.word	20
	.word	1
	.word	1
	.word	1
	.word	2
	.type	ill_conditioned_inversion_result, %object
	.size	ill_conditioned_inversion_result, 144
ill_conditioned_inversion_result:
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.type	well_conditioned_matrix, %object
	.size	well_conditioned_matrix, 144
well_conditioned_matrix:
	.word	1
	.word	2
	.word	1
	.word	1
	.word	2
	.word	1
	.word	5
	.word	2
	.word	7
	.word	1
	.word	1
	.word	3
	.word	7
	.word	1
	.word	1
	.word	4
	.word	1
	.word	2
	.word	1
	.word	1
	.word	5
	.word	2
	.word	3
	.word	7
	.word	1
	.word	2
	.word	5
	.word	2
	.word	2
	.word	1
	.word	1
	.word	2
	.word	1
	.word	1
	.word	1
	.word	2
	.type	well_conditioned_inversion_result, %object
	.size	well_conditioned_inversion_result, 144
well_conditioned_inversion_result:
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%10d \000"
	.space	2
.LC1:
	.ascii	"divide by zero error\012\000"
	.space	2
.LC2:
	.ascii	"Start: %d\012\000"
	.space	1
.LC3:
	.ascii	"ill-conditioned matrix:\012\000"
	.space	3
.LC4:
	.ascii	"warning! condition_number is over 10: %d\012\012\000"
	.space	1
.LC5:
	.ascii	"condition_number: %d\012\012\000"
	.space	1
.LC6:
	.ascii	"scale factor: %d\012\012\000"
	.space	1
.LC7:
	.ascii	"well-conditioned matrix:\012\000"
	.space	2
.LC8:
	.ascii	"End: %d\012\000"
	.space	3
.LC9:
	.ascii	"Clock ticks: %f\012\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
