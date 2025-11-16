
.data

.text

li $s0, 0 #contador
li $a0, 101 #100 primeiros numeros
li $t1, 0

ciclo:
	beq $s0, $a0,fim #se estivermos no numero 101 vai para o fim
	
	add $t1,$t1,$s0 #faz a soma do numero 
	addi $s0,$s0,1 #vai para o proximo numero
	j ciclo #jump para o ciclo
fim:

li $v0, 1
move $a0, $t1
syscall #imprimir
