.data

     tab_hex: .byte 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 
                      0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71     

.text
        li $t0, 0 
	li $s0, 0xFFFF0010
loop:
    
    lbu $t1, tab_hex($t0)
    sb $t1, 0($s0) 
    addi $t0, $t0, 4
    
    li $t2, 16
    bne $t0, $t2, loop 

    
    li $v0, 10
    syscall
