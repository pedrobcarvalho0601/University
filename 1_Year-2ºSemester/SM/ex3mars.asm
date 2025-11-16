.data
tab: .word 1,2,3,4,5,6,7,8,10,9 #contante .word
n: .ascii "\n"

.text

li $t0, 0
la $a0, tab
li $t3, 0
li $t4, 0

ciclo: 

	beq $t0, 10, fim #ao chegar ao 10 numero sai do ciclo
	
	lw $t1, 0($a0) #guarda o numero da tabela em t1
	addi $a0, $a0, 4 #vai para o proximo numero
	
	add $t2, $t2, $t1 # faz a soma dos numeros da tabela
	addi $t0, $t0, 1 #faz a contagem do numero de numeros
	
	#------------------------------------3.2----------------------------------------#
	
	ble $t1 ,$t3, done
	move $t3, $t1 
	done:
	
	j ciclo
fim:
	

li $v0, 1
move $a0, $t2 #imprime a soma
syscall

li $v0, 4
la $a0, n
syscall

li $v0, 1
move $a0, $t3  #imprime o maior numero
syscall





 
 

