# Class CS2640
# AuthorName: Bryce Lam, Loc Nguyen, Colin Mcgough, Evan Cheng
# Date: 10/19/22
# Objective 1: Take two user inputs and hold in register s0 and s1. Then, print it back to user
# Objective 2: Using the two user inputs, perform add, sub, mul, and div, outputing these results back to user
# Objective 3: Compare these two inputs and output comparison
# Github link: https://github.com/The-Avengers-Assembly/Project-1

.data
msg1: .asciiz "Input your first number: "
num1: .asciiz "First input is "
msg2: .asciiz "Input your second number: "
num2: .asciiz "\nSecond input is " 

sum: .asciiz "\nThe sum is "
diff: .asciiz "\nThe difference is "
product: .asciiz "\nThe product is "
quotient: .asciiz "\nThe quotient is "

task1: .asciiz "\nTask 1 completed\n"
task2: .asciiz "\nTask 2 completed\n"
task3: .asciiz "\nTask 3 completed\n"

equalmsg: .asciiz "\nUser inputs are the same"
unequalmsg: .asciiz "\nUser inputs are different"

.text
main:
	#prompt user first input
	li $v0, 4
	la $a0, msg1
	syscall
	#get first input
	li $v0, 5
	syscall 
	#move first input to s0
	move $s0, $v0
	
	#prompt user second input
	li $v0, 4
	la $a0, msg2
	syscall
	#get second input
	li $v0, 5
	syscall
	#move second input to s1
	move $s1, $v0
	
	#print first input
	li $v0, 4
	la $a0, num1
	syscall
	li $v0, 1
	la $a0, ($s0)
	syscall
	#print second input
	li $v0, 4
	la $a0, num2
	syscall 
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	#print task 1 confirmation
	li $v0, 4
	la $a0, task1
	syscall
	
	#perform operations
	add $s2,$s0,$s1
	sub $s3,$s0,$s1
	mul $s4,$s0,$s1
	div $s5,$s0,$s1
	
	#output results of operations
	li $v0, 4
	la $a0, sum
	syscall
	li $v0, 1
	la $a0, ($s2)	#sum
	syscall
	
	li $v0, 4
	la $a0, diff	
	syscall
	li $v0, 1
	la $a0, ($s3)	#difference
	syscall
	
	li $v0, 4
	la $a0, product
	syscall
	li $v0, 1
	la $a0, ($s4)	#product
	syscall
	
	li $v0, 4
	la $a0, quotient
	syscall
	li $v0, 1
	la $a0, ($s5)	#quotient 
	syscall 
	
	#Task 2 confirmation
	li $v0, 4
	la $a0, task2
	syscall
	
	#compare the inputs
	beq $s0, $s1, equals
	bne $s0, $s1, notequals
	
equals:
	#print equalmsg
	li $v0, 4
	la $a0, equalmsg
	syscall
	#task 3 confirmation
	li $v0, 4
	la $a0, task3
	syscall
	j exit
	
notequals:
	#print unequalsmsg
	li $v0, 4
	la $a0, unequalmsg
	syscall
	#task 3 confirmation
	li $v0, 4
	la $a0, task3
	syscall
	j exit
	
exit:
	li $v0, 10
	syscall
