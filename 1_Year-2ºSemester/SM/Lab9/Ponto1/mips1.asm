.data
	
	
.text


li $a0, 1
li $a1, 5
li $v0, 0

.globl	Mandelbrot


	mul $a0, $a0, $a0
	
Mandelbrot:

	addi $a1, $a1, -1

	mul $a0, $a0, $a1
	bnez $a1, Mandelbrot
	
	 
	
	move $v0, $a0
		
	jr	$ra
	
	
	
