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
	.file	"main.c"
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
	.ascii	"ill-conditioned matrix:\012\000"
	.align	2
.LC1:
	.ascii	"warning! condition_number is over 10: %d\012\012\000"
	.align	2
.LC2:
	.ascii	"condition_number: %d\012\012\000"
	.align	2
.LC3:
	.ascii	"scale factor: %d\012\012\000"
	.align	2
.LC4:
	.ascii	"well-conditioned matrix:\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r0, .L7
	bl	puts
	ldr	r0, .L7+4
	mov	r1, #6
	bl	print_matrix
	ldr	r0, .L7+4
	ldr	r1, .L7+8
	mov	r2, #6
	bl	scale_up
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r0, .L7+4
	mov	r1, #6
	bl	calculate_condition_number
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #10
	ble	.L2
	ldr	r0, .L7+12
	ldr	r1, [fp, #-8]
	bl	printf
	b	.L3
.L2:
	ldr	r0, .L7+16
	ldr	r1, [fp, #-8]
	bl	printf
.L3:
	ldr	r0, .L7+4
	ldr	r1, .L7+8
	mov	r2, #6
	ldr	r3, [fp, #-12]
	bl	invert_matrix
	ldr	r0, .L7+8
	mov	r1, #6
	bl	print_matrix
	ldr	r0, .L7+20
	ldr	r1, [fp, #-12]
	bl	printf
	ldr	r0, .L7+24
	bl	puts
	ldr	r0, .L7+28
	mov	r1, #6
	bl	print_matrix
	ldr	r0, .L7+28
	ldr	r1, .L7+32
	mov	r2, #6
	bl	scale_up
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r0, .L7+28
	mov	r1, #6
	bl	calculate_condition_number
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #10
	ble	.L4
	ldr	r0, .L7+12
	ldr	r1, [fp, #-8]
	bl	printf
	b	.L5
.L4:
	ldr	r0, .L7+16
	ldr	r1, [fp, #-8]
	bl	printf
.L5:
	ldr	r0, .L7+28
	ldr	r1, .L7+32
	mov	r2, #6
	ldr	r3, [fp, #-12]
	bl	invert_matrix
	ldr	r0, .L7+32
	mov	r1, #6
	bl	print_matrix
	ldr	r0, .L7+20
	ldr	r1, [fp, #-12]
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	ill_conditioned_matrix
	.word	ill_conditioned_inversion_result
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	well_conditioned_matrix
	.word	well_conditioned_inversion_result
	.size	main, .-main
	.section	.rodata
	.align	2
.LC5:
	.ascii	"divide by zero error\012\000"
	.global	__aeabi_idiv
	.text
	.align	2
	.global	invert_matrix
	.type	invert_matrix, %function
invert_matrix:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #48
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	str	r2, [fp, #-56]
	str	r3, [fp, #-60]
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L10
.L28:
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-36]
	b	.L11
.L13:
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-44]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-44]
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	ble	.L12
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-44]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-24]
.L12:
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L11:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L13
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	beq	.L14
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L15
.L16:
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-44]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-36]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-44]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r0, r3, r2
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-36]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [r0, r1, asl #2]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r1, r3, r2
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-20]
	str	r3, [r1, r2, asl #2]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L15:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L16
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L17
.L18:
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-44]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	ldr	r3, [fp, #-36]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-44]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r0, r3, r2
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	ldr	r3, [fp, #-36]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [r0, r1, asl #2]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r1, r3, r2
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-16]
	str	r3, [r1, r2, asl #2]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L17:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L18
.L14:
	ldr	r3, [fp, #-44]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-44]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L19
	ldr	r0, .L30
	bl	puts
	b	.L29
.L19:
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L21
.L22:
	ldr	r3, [fp, #-44]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r4, r3, r2
	ldr	r5, [fp, #-40]
	ldr	r3, [fp, #-44]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-40]
	ldr	r3, [r2, r3, asl #2]
	ldr	r2, [fp, #-32]
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [r4, r5, asl #2]
	ldr	r3, [fp, #-44]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r4, r3, r2
	ldr	r5, [fp, #-40]
	ldr	r3, [fp, #-44]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	ldr	r3, [fp, #-40]
	ldr	r3, [r2, r3, asl #2]
	ldr	r2, [fp, #-32]
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [r4, r5, asl #2]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L21:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L22
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L23
.L27:
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-44]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	beq	.L24
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L25
.L26:
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r1, r3, r2
	ldr	r0, [fp, #-40]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-40]
	ldr	ip, [r2, r3, asl #2]
	ldr	r3, [fp, #-44]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldr	r3, [fp, #-40]
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-32]
	mul	r3, r2, r3
	rsb	r3, r3, ip
	str	r3, [r1, r0, asl #2]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r1, r3, r2
	ldr	r0, [fp, #-40]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	ldr	r3, [fp, #-40]
	ldr	ip, [r2, r3, asl #2]
	ldr	r3, [fp, #-44]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	ldr	r3, [fp, #-40]
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-32]
	mul	r3, r2, r3
	rsb	r3, r3, ip
	str	r3, [r1, r0, asl #2]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L25:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L26
.L24:
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L23:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L27
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L10:
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L28
.L29:
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	.LC5
	.size	invert_matrix, .-invert_matrix
	.section	.rodata
	.align	2
.LC6:
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
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L33
.L36:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L34
.L35:
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r3, r2
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, asl #2]
	ldr	r0, .L38
	mov	r1, r3
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L34:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L35
	mov	r0, #10
	bl	putchar
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L33:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L36
	mov	r0, #10
	bl	putchar
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	.LC6
	.size	print_matrix, .-print_matrix
	.align	2
	.global	scale_up
	.type	scale_up, %function
scale_up:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L41
.L45:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L42
.L44:
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r3, r2
	ldr	r3, [fp, #-12]
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L43
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r3, r2
	ldr	r3, [fp, #-12]
	ldr	r3, [r2, r3, asl #2]
	str	r3, [fp, #-20]
.L43:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L42:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L44
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L41:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L45
	mov	r3, #16777216
	ldr	r2, [fp, #-20]
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L46
.L49:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L47
.L48:
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r1, r3, r2
	ldr	r0, [fp, #-12]
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r2, r3, r2
	ldr	r3, [fp, #-12]
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-8]
	mul	r3, r2, r3
	str	r3, [r1, r0, asl #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L47:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L48
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L46:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L49
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
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
	str	r0, [fp, #-184]
	str	r1, [fp, #-188]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L52
.L58:
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L53
.L56:
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-184]
	add	r2, r3, r2
	ldr	r3, [fp, #-16]
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	bge	.L54
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-184]
	add	r2, r3, r2
	ldr	r3, [fp, #-16]
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-12]
	rsb	r3, r2, r3
	str	r3, [fp, #-12]
	b	.L55
.L54:
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-184]
	add	r2, r3, r2
	ldr	r3, [fp, #-16]
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	str	r3, [fp, #-12]
.L55:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L53:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-188]
	cmp	r2, r3
	blt	.L56
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	ble	.L57
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-28]
.L57:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L52:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-188]
	cmp	r2, r3
	blt	.L58
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L59
.L62:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L60
.L61:
	ldr	r0, [fp, #-20]
	ldr	ip, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r2, r2, r3
	ldr	r3, [fp, #-184]
	add	r2, r3, r2
	ldr	r3, [fp, #-16]
	ldr	r3, [r2, r3, asl #2]
	add	r1, r3, #50
	mov	r3, r0
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, ip
	mvn	r2, #171
	mov	r3, r3, asl #2
	sub	r0, fp, #4
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L60:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-188]
	cmp	r2, r3
	blt	.L61
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L59:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-188]
	cmp	r2, r3
	blt	.L62
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L63
.L69:
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L64
.L67:
	ldr	r3, [fp, #-20]
	ldr	r1, [fp, #-16]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, r1
	mvn	r2, #171
	mov	r3, r3, asl #2
	sub	r1, fp, #4
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bge	.L65
	ldr	r3, [fp, #-20]
	ldr	r1, [fp, #-16]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, r1
	mvn	r2, #171
	mov	r3, r3, asl #2
	sub	r0, fp, #4
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	rsb	r3, r2, r3
	str	r3, [fp, #-8]
	b	.L66
.L65:
	ldr	r3, [fp, #-20]
	ldr	r1, [fp, #-16]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, r1
	mvn	r2, #171
	mov	r3, r3, asl #2
	sub	r1, fp, #4
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r3, r3, r2
	str	r3, [fp, #-8]
.L66:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L64:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-188]
	cmp	r2, r3
	blt	.L67
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	ble	.L68
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-24]
.L68:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L63:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-188]
	cmp	r2, r3
	blt	.L69
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
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
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	calculate_condition_number, .-calculate_condition_number
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
