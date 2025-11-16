.data

.text

    li  $v0, 5          
    syscall
    
    move $t1, $v0
    
    li $t0, 3 
    
    mul $t1, $t1, $t0 
    sub $t1, $t1, 1
     
    li $a0, 1
    	
    ciclo:
    
    li $v0, 1
    syscall 
    
    add $a0, $a0, 1
        
    bne $a0, $t1, ciclo
   
