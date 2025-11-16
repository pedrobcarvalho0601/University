.data

amarelo: .word 0x00FFFF00
endereco: .word 0x10010000

.text

lw $a3, amarelo
lw $t2, endereco 

sw $a3, 0($t2)

li $a1, 30
li $a2, 20

li $t0, 0
li $t1, 0

altura:
	
	beq $t1, $a2, fim
	
	sw $a3, 0($t2)
	
	linha:
		beq $t0, $a1, fimlinha
		sw $a3, 0($t2)
		add $t2, $t2, 4
	
		addi $t0, $t0, 1
		
		j linha
	fimlinha:
	
	addi $t1, $t1, 1
	add $t2, $t2, 136
	li $t0, 0
	
	j altura
	
fim:
