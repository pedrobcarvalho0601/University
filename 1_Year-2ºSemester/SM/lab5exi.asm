.data

tab: .word 1,3,3,5,5,6,7,8,9
enter: .asciiz "\n"
.text

la $t0,tab
li $s1,0
li $a1, 9 #numero de elementos da tabela

loop:
lw $a0,0($t0)
and $t1,$a0,0x00000001
beq $t1,$zero,jump
add $s1,$s1,1
jump:
addi $a1,$a1,-1
addi $t0,$t0,4	
	li  $v0, 35         
    	move $a0, $t1
    	syscall
    	
    	li  $v0, 4        
    	la $a0, enter
    	syscall
    	
bnez $a1,loop
    		
 li $v0, 10
 syscall
	
