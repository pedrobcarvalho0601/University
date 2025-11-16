.data
largura: .word 30 
altura:  .word 20
endereco_base: .word 0x10010000
yellow: .word 0x00FFFF00 
.text

    lw $t0, largura
    lw $t1, altura
    lw $t2, endereco_base
    lw $t6, yellow
    li $t3, 0
    li $t4, 0

    loop_altura:
          li $t3,0

           loop_largura:
                sw $t6, 0($t2)
                addi $t2, $t2, 4
                addi $t3, $t3, 1 
                bne $t3, $t0 ,loop_largura           
                #altura
                #calculo do espaço para mudar de linha
                #256/4=64  64-30(largura)=34  34*4=136            
            addi $t2, $t2, 136 
            addi $t4, $t4, 1
            bne $t4, $t1, loop_altura
            
