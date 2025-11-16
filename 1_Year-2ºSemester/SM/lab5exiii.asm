.data

tab: .asciiz "ola" 

.text

li $s0, 0x11011111



la $t0, tab
lw $t0, 0($t0)

and $a0, $t0, $s0
sll $t0, $t0, 8
