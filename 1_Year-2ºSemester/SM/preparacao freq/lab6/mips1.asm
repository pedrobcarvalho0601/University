	.file	1 "sum_v1.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 1
	.abicalls
	.option	pic0
	.rdata
	.align	2
$LC0:
	.ascii	"Enter the first number: \000"
	.align	2
$LC1:
	.ascii	"%d\000"
	.align	2
$LC2:
	.ascii	"Enter the second number: \000"
	.align	2
$LC3:
	.ascii	"The sum of %d with %d is %d \012\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
	.type	main, @function
main:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	lui	$2,%hi($LC0)
	addiu	$2,$2,%lo($LC0)
	move	$4,$2
	jal	printf
	nop

	lui	$2,%hi($LC1)
	addiu	$3,$2,%lo($LC1)
	addiu	$2,$fp,28
	move	$4,$3
	move	$5,$2
	jal	__isoc99_scanf
	nop

	lui	$2,%hi($LC2)
	addiu	$2,$2,%lo($LC2)
	move	$4,$2
	jal	printf
	nop

	lui	$2,%hi($LC1)
	addiu	$3,$2,%lo($LC1)
	addiu	$2,$fp,32
	move	$4,$3
	move	$5,$2
	jal	__isoc99_scanf
	nop

	lw	$3,28($fp)
	lw	$2,32($fp)
	addu	$2,$3,$2
	sw	$2,24($fp)
	lui	$2,%hi($LC3)
	addiu	$4,$2,%lo($LC3)
	lw	$3,28($fp)
	lw	$2,32($fp)
	move	$5,$3
	move	$6,$2
	lw	$7,24($fp)
	jal	printf
	nop

	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Debian 4.6.3-14) 4.6.3"
