
.data
direita: .word 0xFFFF0010
esquerda: .word 0xFFFF0011

     tab_hex: .byte 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71   

.text 

li $s0, 0xFFFF0010
li $s1, 0xFFFF0011

li $t4, 1
loop_e:
	li $t0, 0 
	
				
	loop_d:
    
    lbu $t1, tab_hex($t0)
    sb $t1, 0($s0) 
    addi $t0, $t0, 1
   
    li $t2, 16
    bne $t0, $t2, loop_d 
    
    
    
     lbu $t3, tab_hex($t4)
    sb $t3, 0($s1) 
    addi $t4, $t4, 1
    li $t5, 16
    bne $t4, $t5, loop_e
