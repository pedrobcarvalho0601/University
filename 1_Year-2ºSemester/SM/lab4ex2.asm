.data
	
	Tab: .byte 1,3,5,7,9,5,7,9,
	enter: .asciiz "\n"
.text
	
	li $t0, 0
	li $t1, 0
	li $t2, 0
	
	la $a0, Tab
	lb $a0, 0($a0)
	
	loop:
	lbu $a0, Tab($t3) 
    	
    	jal oddnumber 
    	addi $t3, $t3, 4
    	
    		
	li  $v0, 35         
    	move $a0, $a2
    	syscall
	
	li  $v0, 4        
    	la $a0, enter
    	syscall
	
   	bne $t3, 9, loop 
   	
 li $v0, 10
 syscall


	
	#
	oddnumber:	
	li $s2, 0x00000001
	and $a2, $a0, $s2
	beq $a2 $zero, jump 
	add $t1, $t1, 1  
	jump: 
		
	jr $ra
