.data
	arr : .word 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0
	size : .word 20

.text
main:
li $t0, 0		# zero counter
li $t1, 0		# one counter
jal group

jal insert		# change array

li $v0, 10
syscall

group:
li $s0, 0		# loop counter
la $t2, size
lw $t2, 0($t2)
la $t3, arr

loop:
beq $s0, $t2, end	# end loop
lw $s1, 0($t3)		# load current element
addi $t3, $t3, 4	# next element
addi $s0, $s0, 1	# inc loop counter
li $s2, 1
beq $s1, $0, loop1
beq $s1, $s2,loop2


loop1:
addi $t0, $t0, 1	# inc zero counter
j loop

loop2:
addi $t1, $t1, 1	# inc one counter
j loop

end:
jr $ra


insert:
la $t3, arr
li $t2, 0		# zero loop counter(t2->0)
li $t4, 0		# one loop counter(t4->0)
li $t5, 1

loop4:
beq $t2, $t0,loop5
addi $t2, $t2, 1       #t2=t2+1
sw $0, 0($t3)
addi $t3, $t3, 4       #t3=t3+4
j loop4

loop5:
beq $t4, $t1, end
addi $t4, $t4, 1      
sw $t5, 0($t3)
addi $t3, $t3, 4	
j loop5