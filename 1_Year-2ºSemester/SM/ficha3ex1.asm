.data
direita: .word 0xFFFF0010
esquerda: .word 0xFFFF0011
  
.text

li $t0, 1
li  $s0, 0xFFFF0010

loop:
	
	sb $t0, 0($s0)
	sll $t0, $t0, 1
	
	li $t1, 128
	bne $t0, $t1, loop
	sb $t0, 0($s0)

