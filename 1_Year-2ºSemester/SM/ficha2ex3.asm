.data
cor: .word 0x00000000
.text

    li $t0, 0

    linha_loop:
        li $t1, 0

    coluna_loop:


            mul $t2, $t0, 64   
            add $t2, $t2, $t1  
            sll $t2, $t2, 2   

    
            move $t3, $t0        
            move $t4, $t1         
            li $t5, 0            


            sll $t3, $t3, 18
            sll $t4, $t4, 10
            or $t3, $t3, $t4   
           or $t3, $t3, $t5  

            sw $t3, cor($t2)


            addi $t1, $t1, 1	
            blt $t1, 64, coluna_loop 


            addi $t0, $t0, 1
            blt $t0, 32, linha_loop   

 
        li $v0, 10       
        syscall
