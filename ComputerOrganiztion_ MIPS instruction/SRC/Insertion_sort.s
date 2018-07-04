.data
Array: 
	.word 9, 2, 8, 1, 6, 5, 4, 10, 3, 7 # you can change the element of array


.text
main:
	
	addi $t0, $zero, 4097      # $t0 = 0x00001001

	sll  $t0, $t0, 16          # set the base address of your array into $t0 = 0x10010000    

	
#--------------------------------------#
	#  \^o^/   Write your code here~  \^o^/#
	#--------------------------------------#
	add  $t1, $zero, $zero
L1:	addi $t1, $t1, 1
	slti $t3, $t1, 10
	beq  $t3, $zero, End
	add  $t2, $t1, $zero
L2:	slt  $t3, $zero, $t2
	beq  $t3, $zero, L3
	addi $t3, $t2, -1
	add  $t4, $t2, $zero
	sll  $t3, $t3, 2
	add  $t3, $t3, $t0
	sll  $t4, $t4, 2
	add  $t4, $t4, $t0
	lw   $t5, 0($t3)	#j-1
	lw   $t6, 0($t4)	#j
	slt  $t7, $t6, $t5
	beq  $t7, $zero, L3
	sw   $t6, 0($t3)
	sw   $t5, 0($t4)
	addi $t2, $t2, -1
	j L2
L3:	addi $t2, $t2, -1
	j L1
End:	li   $v0, 10               # program stop
	
syscall