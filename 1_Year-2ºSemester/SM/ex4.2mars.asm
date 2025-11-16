.data
.text
    li  $v0, 5          
    syscall
    
    move $t0, $v0
    li $a0, 1
    li $a1, 1
    
    add $t0, $t0, 1
    
    ciclo:
    
    mul $a0, $a0, $a1
    add $a1, $a1, 1
        
    bne $a1, $t0, ciclo
    
    li $v0, 1
    syscall