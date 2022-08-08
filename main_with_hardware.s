	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"main_with_hardware.c"
	.global	well_conditioned_matrix
	.data
	.align	2
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
	.global	well_conditioned_inversion_result
	.align	2
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
	.global	ill_conditioned_matrix
	.align	2
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
	.global	ill_conditioned_inversion_result
	.align	2
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
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Start: %d\012\000"
	.align	2
.LC1:
	.ascii	"ill-conditioned matrix:\012\000"
	.align	2
.LC2:
	.ascii	"warning! condition_number is over 10: %d\012\012\000"
	.align	2
.LC3:
	.ascii	"condition_number: %d\012\012\000"
	.align	2
.LC4:
	.ascii	"scale factor: %d\012\012\000"
	.align	2
.LC5:
	.ascii	"well-conditioned matrix:\012\000"
	.align	2
.LC6:
	.ascii	"End: %d\012\000"
	.global	__aeabi_i2d
	.global	__aeabi_ddiv
	.global	__aeabi_dmul
	.align	2
.LC7:
	.ascii	"Clock ticks: %f\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #28
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r0, .L7+8
	ldr	r1, [fp, #-36]
	bl	printf
	ldr	r0, .L7+12
	bl	puts
	ldr	r0, .L7+16
	mov	r1, #6
	bl	print_matrix
	ldr	r0, .L7+16
	ldr	r1, .L7+20
	mov	r2, #6
	bl	scale_up
	mov	r3, r0
	str	r3, [fp, #-44]
	ldr	r0, .L7+16
	mov	r1, #6
	bl	calculate_condition_number
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #10
	ble	.L2
	ldr	r0, .L7+24
	ldr	r1, [fp, #-40]
	bl	printf
	b	.L3
.L2:
	ldr	r0, .L7+28
	ldr	r1, [fp, #-40]
	bl	printf
.L3:
	ldr	r0, .L7+16
	ldr	r1, .L7+20
	mov	r2, #6
	ldr	r3, [fp, #-44]
	bl	invert_matrix
	ldr	r0, .L7+20
	mov	r1, #6
	bl	print_matrix
	ldr	r0, .L7+32
	ldr	r1, [fp, #-44]
	bl	printf
	ldr	r0, .L7+36
	bl	puts
	ldr	r0, .L7+40
	mov	r1, #6
	bl	print_matrix
	ldr	r0, .L7+40
	ldr	r1, .L7+44
	mov	r2, #6
	bl	scale_up
	mov	r3, r0
	str	r3, [fp, #-44]
	ldr	r0, .L7+40
	mov	r1, #6
	bl	calculate_condition_number
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #10
	ble	.L4
	ldr	r0, .L7+24
	ldr	r1, [fp, #-40]
	bl	printf
	b	.L5
.L4:
	ldr	r0, .L7+28
	ldr	r1, [fp, #-40]
	bl	printf
.L5:
	ldr	r0, .L7+40
	ldr	r1, .L7+44
	mov	r2, #6
	ldr	r3, [fp, #-44]
	bl	invert_matrix
	ldr	r0, .L7+44
	mov	r1, #6
	bl	print_matrix
	ldr	r0, .L7+32
	ldr	r1, [fp, #-44]
	bl	printf
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r0, .L7+48
	ldr	r1, [fp, #-32]
	bl	printf
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	rsb	r3, r3, r2
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1090519040
	add	r6, r6, #3047424
	add	r6, r6, #1152
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	adr	r6, .L7
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	ldr	r0, .L7+52
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
.L8:
	.align	3
.L7:
	.word	0
	.word	1102567300
	.word	.LC0
	.word	.LC1
	.word	ill_conditioned_matrix
	.word	ill_conditioned_inversion_result
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	well_conditioned_matrix
	.word	well_conditioned_inversion_result
	.word	.LC6
	.word	.LC7
	.size	main, .-main
	.section	.rodata
	.align	2
.LC8:
	.ascii	"divide by zero error\012\000"
	.global	__aeabi_idiv
	.text
	.align	2
	.global	invert_matrix
	.type	invert_matrix, %function
invert_matrix:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #60
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	str	r2, [fp, #-56]
	str	r3, [fp, #-60]
	mov	r1, #0
	str	r1, [fp, #-76]
	b	.L10
.L26:
	mov	r3, #0
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-76]
	str	r2, [fp, #-64]
	ldr	r3, [fp, #-76]
	str	r3, [fp, #-68]
	b	.L11
.L13:
	ldr	r3, [fp, #-68]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-76]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-68]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-76]
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	ble	.L12
	ldr	r3, [fp, #-68]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-76]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-40]
	ldr	ip, [fp, #-68]
	str	ip, [fp, #-64]
.L12:
	ldr	r1, [fp, #-68]
	add	r1, r1, #1
	str	r1, [fp, #-68]
.L11:
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-68]
	cmp	r2, r3
	blt	.L13
	ldr	r3, [fp, #-64]
	ldr	ip, [fp, #-76]
	cmp	r3, ip
	beq	.L14
	mov	r1, #0
	str	r1, [fp, #-68]
	b	.L15
.L16:
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-68]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r0, r3, r2
	ldr	r1, [fp, #-68]
	ldr	r3, [fp, #-64]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-68]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [r0, r1, asl #2]
	ldr	r3, [fp, #-64]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r1, r3, r2
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-36]
	str	r3, [r1, r2, asl #2]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	ip, [fp, #-68]
	add	r3, ip, #1
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r0, r3, r2
	ldr	r2, [fp, #-68]
	add	r1, r2, #1
	ldr	r3, [fp, #-64]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	ip, [fp, #-68]
	add	r3, ip, #1
	ldr	r3, [r2, r3, asl #2]
	str	r3, [r0, r1, asl #2]
	ldr	r3, [fp, #-64]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r1, r3, r2
	ldr	r3, [fp, #-68]
	add	r2, r3, #1
	ldr	r3, [fp, #-32]
	str	r3, [r1, r2, asl #2]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-68]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r0, r3, r2
	ldr	r1, [fp, #-68]
	ldr	r3, [fp, #-64]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-68]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [r0, r1, asl #2]
	ldr	r3, [fp, #-64]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r1, r3, r2
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-28]
	str	r3, [r1, r2, asl #2]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	ip, [fp, #-68]
	add	r3, ip, #1
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r0, r3, r2
	ldr	r2, [fp, #-68]
	add	r1, r2, #1
	ldr	r3, [fp, #-64]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	ip, [fp, #-68]
	add	r3, ip, #1
	ldr	r3, [r2, r3, asl #2]
	str	r3, [r0, r1, asl #2]
	ldr	r3, [fp, #-64]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r1, r3, r2
	ldr	r3, [fp, #-68]
	add	r2, r3, #1
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2, asl #2]
	ldr	ip, [fp, #-68]
	add	ip, ip, #2
	str	ip, [fp, #-68]
.L15:
	ldr	r3, [fp, #-56]
	ldr	r1, [fp, #-68]
	cmp	r1, r3
	blt	.L16
.L14:
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-76]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	bne	.L17
	ldr	r0, .L28
	bl	puts
	b	.L27
.L17:
	mov	r2, #0
	str	r2, [fp, #-72]
	b	.L19
.L20:
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r4, r3, r2
	ldr	r5, [fp, #-72]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-72]
	ldr	r3, [r2, r3, asl #2]
	ldr	r2, [fp, #-44]
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [r4, r5, asl #2]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r4, r3, r2
	ldr	r5, [fp, #-72]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	ldr	r3, [fp, #-72]
	ldr	r3, [r2, r3, asl #2]
	ldr	r2, [fp, #-44]
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [r4, r5, asl #2]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r4, r3, r2
	ldr	r3, [fp, #-72]
	add	r5, r3, #1
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	ip, [fp, #-72]
	add	r3, ip, #1
	ldr	r3, [r2, r3, asl #2]
	ldr	r2, [fp, #-44]
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [r4, r5, asl #2]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r4, r3, r2
	ldr	r1, [fp, #-72]
	add	r5, r1, #1
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	ldr	ip, [fp, #-72]
	add	r3, ip, #1
	ldr	r3, [r2, r3, asl #2]
	ldr	r2, [fp, #-44]
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [r4, r5, asl #2]
	ldr	r1, [fp, #-72]
	add	r1, r1, #2
	str	r1, [fp, #-72]
.L19:
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-72]
	cmp	r2, r3
	blt	.L20
	mov	r3, #0
	str	r3, [fp, #-68]
	b	.L21
.L25:
	ldr	r3, [fp, #-68]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-76]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-44]
	ldr	ip, [fp, #-68]
	ldr	r1, [fp, #-76]
	cmp	ip, r1
	beq	.L22
	mov	r2, #0
	str	r2, [fp, #-72]
	b	.L23
.L24:
	ldr	r3, [fp, #-68]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r4, r3, r2
	ldr	r5, [fp, #-72]
	ldr	r3, [fp, #-68]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-72]
	ldr	r6, [r2, r3, asl #2]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-72]
	ldr	r3, [r2, r3, asl #2]
	mov	r0, r3
	ldr	r1, [fp, #-44]
	bl	hardware_multiplier
	mov	r3, r0
	rsb	r3, r3, r6
	str	r3, [r4, r5, asl #2]
	ldr	r3, [fp, #-68]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r4, r3, r2
	ldr	r5, [fp, #-72]
	ldr	r3, [fp, #-68]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	ldr	r3, [fp, #-72]
	ldr	r6, [r2, r3, asl #2]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	ldr	r3, [fp, #-72]
	ldr	r3, [r2, r3, asl #2]
	mov	r0, r3
	ldr	r1, [fp, #-44]
	bl	hardware_multiplier
	mov	r3, r0
	rsb	r3, r3, r6
	str	r3, [r4, r5, asl #2]
	ldr	r3, [fp, #-68]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r4, r3, r2
	ldr	r3, [fp, #-72]
	add	r5, r3, #1
	ldr	r3, [fp, #-68]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	ip, [fp, #-72]
	add	r3, ip, #1
	ldr	r6, [r2, r3, asl #2]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r1, [fp, #-72]
	add	r3, r1, #1
	ldr	r3, [r2, r3, asl #2]
	mov	r0, r3
	ldr	r1, [fp, #-44]
	bl	hardware_multiplier
	mov	r3, r0
	rsb	r3, r3, r6
	str	r3, [r4, r5, asl #2]
	ldr	r3, [fp, #-68]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r4, r3, r2
	ldr	r2, [fp, #-72]
	add	r5, r2, #1
	ldr	r3, [fp, #-68]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	ldr	ip, [fp, #-72]
	add	r3, ip, #1
	ldr	r6, [r2, r3, asl #2]
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	ldr	r1, [fp, #-72]
	add	r3, r1, #1
	ldr	r3, [r2, r3, asl #2]
	mov	r0, r3
	ldr	r1, [fp, #-44]
	bl	hardware_multiplier
	mov	r3, r0
	rsb	r3, r3, r6
	str	r3, [r4, r5, asl #2]
	ldr	r2, [fp, #-72]
	add	r2, r2, #2
	str	r2, [fp, #-72]
.L23:
	ldr	r3, [fp, #-56]
	ldr	ip, [fp, #-72]
	cmp	ip, r3
	blt	.L24
.L22:
	ldr	r1, [fp, #-68]
	add	r1, r1, #1
	str	r1, [fp, #-68]
.L21:
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-68]
	cmp	r2, r3
	blt	.L25
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
.L10:
	ldr	r3, [fp, #-56]
	ldr	ip, [fp, #-76]
	cmp	ip, r3
	blt	.L26
.L27:
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	.LC8
	.size	invert_matrix, .-invert_matrix
	.section	.rodata
	.align	2
.LC9:
	.ascii	"%10d \000"
	.text
	.align	2
	.global	print_matrix
	.type	print_matrix, %function
print_matrix:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r2, #0
	str	r2, [fp, #-20]
	b	.L31
.L34:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L32
.L33:
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-8]
	add	r2, r3, r2
	ldr	r3, [fp, #-16]
	ldr	r3, [r2, r3, asl #2]
	ldr	r0, .L36
	mov	r1, r3
	bl	printf
	ldr	r2, [fp, #-16]
	add	r2, r2, #1
	str	r2, [fp, #-16]
.L32:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	blt	.L33
	mov	r0, #10
	bl	putchar
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L31:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	blt	.L34
	mov	r0, #10
	bl	putchar
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	.LC9
	.size	print_matrix, .-print_matrix
	.align	2
	.global	scale_up
	.type	scale_up, %function
scale_up:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r2, #0
	str	r2, [fp, #-40]
	b	.L39
.L43:
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L40
.L42:
	ldr	r3, [fp, #-40]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r3, r2
	ldr	r3, [fp, #-36]
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L41
	ldr	r3, [fp, #-40]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r3, r2
	ldr	r3, [fp, #-36]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-20]
.L41:
	ldr	r2, [fp, #-36]
	add	r2, r2, #1
	str	r2, [fp, #-36]
.L40:
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-36]
	cmp	r2, r3
	blt	.L42
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L39:
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	cmp	r2, r3
	blt	.L43
	mov	r3, #16777216
	ldr	r2, [fp, #-20]
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L44
.L47:
	mov	r2, #0
	str	r2, [fp, #-36]
	b	.L45
.L46:
	ldr	r3, [fp, #-40]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r4, r3, r2
	ldr	r5, [fp, #-36]
	ldr	r3, [fp, #-40]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r2, r3, r2
	ldr	r3, [fp, #-36]
	ldr	r3, [r2, r3, asl #2]
	mov	r0, r3
	ldr	r1, [fp, #-16]
	bl	hardware_multiplier
	mov	r3, r0
	str	r3, [r4, r5, asl #2]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L45:
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-36]
	cmp	r2, r3
	blt	.L46
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L44:
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	cmp	r2, r3
	blt	.L47
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, lr}
	bx	lr
	.size	scale_up, .-scale_up
	.align	2
	.global	calculate_condition_number
	.type	calculate_condition_number, %function
calculate_condition_number:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 184
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #184
	str	r0, [fp, #-176]
	str	r1, [fp, #-180]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r0, #0
	str	r0, [fp, #-188]
	b	.L50
.L56:
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r1, #0
	str	r1, [fp, #-184]
	b	.L51
.L54:
	ldr	r3, [fp, #-188]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-176]
	add	r2, r3, r2
	ldr	r3, [fp, #-184]
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	bge	.L52
	ldr	r3, [fp, #-188]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-176]
	add	r2, r3, r2
	ldr	r3, [fp, #-184]
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-12]
	rsb	r3, r2, r3
	str	r3, [fp, #-12]
	b	.L53
.L52:
	ldr	r3, [fp, #-188]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-176]
	add	r2, r3, r2
	ldr	r3, [fp, #-184]
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	str	r3, [fp, #-12]
.L53:
	ldr	r2, [fp, #-184]
	add	r2, r2, #1
	str	r2, [fp, #-184]
.L51:
	ldr	r3, [fp, #-180]
	ldr	r0, [fp, #-184]
	cmp	r0, r3
	blt	.L54
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L55
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-20]
.L55:
	ldr	r1, [fp, #-188]
	add	r1, r1, #1
	str	r1, [fp, #-188]
.L50:
	ldr	r3, [fp, #-180]
	ldr	r2, [fp, #-188]
	cmp	r2, r3
	blt	.L56
	mov	r3, #0
	str	r3, [fp, #-188]
	b	.L57
.L60:
	mov	r0, #0
	str	r0, [fp, #-184]
	b	.L58
.L59:
	ldr	r0, [fp, #-188]
	ldr	ip, [fp, #-184]
	ldr	r3, [fp, #-188]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-176]
	add	r2, r3, r2
	ldr	r3, [fp, #-184]
	ldr	r3, [r2, r3, asl #2]
	add	r1, r3, #50
	mov	r3, r0
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, ip
	mvn	r2, #163
	mov	r3, r3, asl #2
	sub	r0, fp, #4
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r1, [fp, #-184]
	add	r1, r1, #1
	str	r1, [fp, #-184]
.L58:
	ldr	r3, [fp, #-180]
	ldr	r2, [fp, #-184]
	cmp	r2, r3
	blt	.L59
	ldr	r3, [fp, #-188]
	add	r3, r3, #1
	str	r3, [fp, #-188]
.L57:
	ldr	r3, [fp, #-180]
	ldr	r0, [fp, #-188]
	cmp	r0, r3
	blt	.L60
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r1, #0
	str	r1, [fp, #-188]
	b	.L61
.L67:
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [fp, #-184]
	b	.L62
.L65:
	ldr	r3, [fp, #-188]
	ldr	r1, [fp, #-184]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, r1
	mvn	r2, #163
	mov	r3, r3, asl #2
	sub	r0, fp, #4
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bge	.L63
	ldr	r3, [fp, #-188]
	ldr	r1, [fp, #-184]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, r1
	mvn	r2, #163
	mov	r3, r3, asl #2
	sub	r1, fp, #4
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	rsb	r3, r2, r3
	str	r3, [fp, #-8]
	b	.L64
.L63:
	ldr	r3, [fp, #-188]
	ldr	r1, [fp, #-184]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, r1
	mvn	r2, #163
	mov	r3, r3, asl #2
	sub	r0, fp, #4
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r3, r3, r2
	str	r3, [fp, #-8]
.L64:
	ldr	r1, [fp, #-184]
	add	r1, r1, #1
	str	r1, [fp, #-184]
.L62:
	ldr	r3, [fp, #-180]
	ldr	r2, [fp, #-184]
	cmp	r2, r3
	blt	.L65
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	ble	.L66
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-16]
.L66:
	ldr	r3, [fp, #-188]
	add	r3, r3, #1
	str	r3, [fp, #-188]
.L61:
	ldr	r3, [fp, #-180]
	ldr	r0, [fp, #-188]
	cmp	r0, r3
	blt	.L67
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r2, r3
	mov	r3, #125
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	calculate_condition_number, .-calculate_condition_number
	.align	2
	.global	hardware_multiplier
	.type	hardware_multiplier, %function
hardware_multiplier:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
#APP
@ 385 "main_with_hardware.c" 1
	hmul r3, r2, r3
	
@ 0 "" 2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	hardware_multiplier, .-hardware_multiplier
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
