.data

.text
.globl remove_outliers

remove_outliers:
	
	li $t0, 0   #contador
	
	bnez $a3,end
loop:
	move $t2, $a3
	
	addi $t1, $t2,-$a1
	bltz $t1, menor  #verificar se e menor
	
	addi $t1, $t2, -$a0 
	bgtz $t1, maior
menor:
	addi $t1, $t1, $t1	#t1=0
	sb $t1,0($a3)
	addi $t0, $t0, 1   #icrementar contador 
	addi $a3, $a3, 1   #proximo valor da tabela
	
	j loop
	
maior:
	addi $t1, $t1, -$t1	#t1=0
	sb $t1,0($a3)
	addi $t0, $t0, 1   #icrementar contador 
	addi $a3, $a3, 1   #proximo valor da tabela
	
	j loop

end:	
	move $v0, $a3
	jr $ra