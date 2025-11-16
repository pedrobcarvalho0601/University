.data
	 num: .word 0x10203040
.text
	la $a0, num 
	lw $a0, 0($a0)
	 
	 jal funcao
	 
	li  $v0, 34          
	move $a0, $t0
    	syscall
 	
 	li $v0, 10 
 	syscall
 	
    	#
    	funcao:
		
    		li $t1, 0xFF000000          
    		and $t2, $a0, $t1     
    		srl $t2, $t2, 24 
    		li $t1, 0x00FF0000    
    		and $t3, $a0, $t1     
    		srl $t3, $t3, 8 
    		li $t1, 0x0000FF00     
    		and $t4, $a0, $t1    
    		sll $t4, $t4, 8 
    		li $t1, 0x000000FF      
    		and $t5, $a0, $t1     
    		sll $t5, $t5, 24 
    		       		 
    		or $t0, $t2, $t3      
    		or $t0, $t0, $t4
   		or $t0, $t0, $t5
    		jr $ra   
