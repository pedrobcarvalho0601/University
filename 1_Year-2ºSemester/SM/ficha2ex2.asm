.data 

.text

li $s0, 8
li $s1, 8
li $s2, 0x10010000
li $s3, 0x00FF00FF 
li $s4, 0x0000FFFF


li $t0, 0
li $t1, 0
											
	loop_alturafundo:
	li $t0, 0
	loop_largurafundo:
	
	sw $s4, 0($s2)
	addi $s2, $s2, 4
	addi $t0, $t0, 1
	bne $t0, 256 ,loop_largurafundo
	
        addi $t1, $t1, 1
        bne $t1, 128, loop_alturafundo
             
li $t0, 0
li $t1, 0
	
	li $s2, 0x10010000
	
	
	addi $s2, $s2, 3184
											
	loop_altura:
	li $t0, 0
	loop_largura:
	
	sw $s3, 0($s2)
	addi $s2, $s2, 4
	addi $t0, $t0, 1
	bne $t0, $s0 ,loop_largura
	
	addi $s2, $s2, 224 
        addi $t1, $t1, 1
        bne $t1, $s1, loop_altura
	
	
