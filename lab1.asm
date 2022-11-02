.data
	finput: .asciiz "Enter a value for f: "
	ginput: .asciiz "Enter a value for g: "
	message: .asciiz "Answer for f = g - (f + 5): "
	newline: .asciiz  "\n"
.text
	loop:
	bgt $t1, 2, exit
	addi $t1, $t1, 1
	
	# Display f prompt
	li $v0, 4 # 4 = code for text printing
	la $a0, finput
	syscall

	# Get the value for f
	li $v0, 5 # 5 = code to tell the computer it is recieving and integer
	syscall
	
	# Store f value
	move $s1, $v0
	
	# Display g prompt
	li $v0, 4
	la $a0, ginput
	syscall

	# Get the value for g
	li $v0, 5
	syscall
	
	# Store g value
	move $t0, $v0
	
	addi $s1, $s1, 5
	sub $s1, $t0, $s1 
	
	# Display message prompt
	li $v0, 4 # 4 = code for text printing
	la $a0, message
	syscall
	
	# Display f value
	li $v0, 1
	move $a0, $s1
	syscall
	
	# Print a new line
	li $v0, 4
	la $a0, newline
	syscall
	
	j loop
	
	exit: