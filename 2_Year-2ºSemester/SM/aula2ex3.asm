.data

cor: .word 0x00000000
endereco: .word 0x10010000

.text

li $t0,1 #linha
li $t1,1 #coluna
li $t3, 0 #cor
li $t4, 1 #final


li $t2, 0x10010000
li $a0, 0x00000000 #r
li $a1, 0x00000000 #g
li $a2, 0x00000000 #b
li $a3, 0x00000000 #cor


linha:

	beq $t4, 2048, fim
	
	sub $t2, $t2, 8192
	addi $t2, $t2, 4
	
	li $t1, 0
	
	mul $t3, $t0, 4
	add $a1, $a1, $t3
	sll $a1, $a1, 8

coluna:

	beq $t2, 8192, linha
	mul $t3, $t1, 4
	add $a0, $a0, $t3
	sll $a0, $a0, 16
	
	or $a3, $a0, $a1
	srl $a1, $a1, 8
	srl $a0, $a0, 16
	
	
	sw $a3, 0($t2)
	
	add $t2, $t2, 256
	addi $t1, $t1, 1
	addi $t0, $t0, 1
	add $t4, $t4, 1
	
	j coluna
	
	
fim:
	
	
	
	