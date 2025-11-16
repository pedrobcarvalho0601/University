.data

azul: .word 0x000000FF
roxo: .word 0x00FF00FF
endereco: .word 0x10010000

.text

lw $a0, azul

lw $a3, roxo
lw $t2, endereco 

li $a1, 30
li $a2, 20

li $t0, 0
li $t1, 0

alturazul:
	
	beq $t1, 32, fimzul
	
	sw $a0, 0($t2)
	
	linhazul:
		beq $t0, 64, fimlinhazul
		sw $a0, 0($t2)
		add $t2, $t2, 4
	
		addi $t0, $t0, 1
		
		j linhazul
	fimlinhazul:
	
	addi $t1, $t1, 1
	add $t2, $t2, 0
	li $t0, 0
	
	j alturazul
	
fimzul:

li $t0, 0 
li $t1, 0 
li $t2, 0x10010000
add $t2, $t2, 3184

j altura

altura:
	beq $t1, 8, fim
	
	sw $a3, 0($t2)
	
	linha:
		beq $t0, 8, fimlinha
		sw $a3, 0($t2)
		add $t2, $t2, 4
	
		addi $t0, $t0, 1
		
		j linha
	fimlinha:
	
	addi $t1, $t1, 1
	add $t2, $t2, 224
	li $t0, 0
	
	j altura
	
fim:
