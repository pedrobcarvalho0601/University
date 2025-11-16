.data
word: .ascii "digite um numero"
n: .ascii "\n"

.text

li $v0, 4
la $a0, word
syscall

li $v0, 5
syscall

move $a1, $v0
mul $a1, $a1, 3

li $t0, 0
li $t1, 1
li $t2, 1

ciclo:
	beq $t0, $a1,fim #se estivermos no numero 101 vai para o fim
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	addi $t0,$t0,1 #vai para o proximo numero
	
	mul $t1, $t1, $t2
	addi $t2, $t2, 1
	
	j ciclo #jump para o ciclo
fim:

li $v0, 4
la $a0, n
syscall

	li $v0, 1
	move $a0, $t1
	syscall





	