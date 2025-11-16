.data 

.text


li $a0, 10   # $a0 = 10
li $a1, 6    # $a1 = 6
li $a2, 7    # $a2 = 7
li $a3, 10   # $a3 = 10

#v0=(a3-a1)-(a0+(-a2)) + 7
sub $t0, $a3, $a1  # $t0 = a3 - a1
sub $t1, $a0, $a2  # $t1 = a0 - a2
sub $t2, $t0, $t1  # $t2 = (a3 - a1) - (a0 - a2)
addi $v0, $t2, 7   # $v0 = (a1 - a3) + 7
