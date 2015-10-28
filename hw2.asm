##############################################################
# Homework #2
# name: Jimmy	
# sbuid: 109259420
##############################################################
.text

##############################
# EASY HELPER FUNCTIONS 
# Suggestion: Do these first
##############################

toUpper:
	#Define your code here
	############################################
	
	bge $a0, 97, g97
	move $v0, $a0
	jr $ra
	g97: 
	ble $a0, 122, tru
	move $v0, $a0
	jr $ra 
	tru:
	addi $v0, $a0, -32 
	jr $ra  
	############################################
	
	

countChars:
	#Define your code here
	lb $s0, ($a0)
	li $s1, 0		#s1 is the counter 
	
	
	start_countChar:
	bge $s0,  65, g65_countChar
	j next_countChar
	
	g65_countChar:
	
	ble $s0, 90, true_countChar
	blt $s0, 97, next_countChar
	ble $s0, 122, true_countChar
	
	true_countChar:
	addi $s1, $s1, 1
	
	next_countChar:
	addi $a0, $a0, 1
	lb $s0, ($a0)
	bnez $s0, start_countChar
	
	end_countChar:
	move $v0, $s1
	jr $ra 

toLower:
	#Define your code here
	###########################################
	# DELETE THIS CODE. Only to allow main program to run without fully implementing the function
	la $t9, ($a0)
	li $t0, 65
	li $t1, 90
	la $s3, ($ra)
	
	toLowerLoop:
	lb $s0, ($a0)
	beqz $s0, end
	bge $s0, $t0, g65
	j next
	
	g65:
	ble $s0, $t1, l90
	j next
	l90:
	addi $s0, $s0, 32
	sb $s0, ($a0)
	
	next:
	addi $a0, $a0, 1
	j toLowerLoop
	
	end:
	move $v0, $t9
	jr $s3
	############################################
	

##############################
# PART 1 FUNCTION
##############################

decodeNull:
	#Define your code here
	li $t0, 65
	la $s6, ($a0)			#load text into s6
	la $s7, ($ra) 
	loopz:
		li $t1, -1 
		lw $s1, ($a3) 
		beqz $s1, skip
		beq $s1, $t1, stop
		add $s6, $s6, $s1
		addi $s6, $s6, -1
		
		check_punc:
		lb $s2, ($s6)
		blt $s2, $t0, jump_one
		j punc_good
		
		jump_one:
		addi $s6, $s6, 1
		j check_punc
		
		punc_good:
		
		
		#lb $s2, ($s6)
		move $a0, $s2
		jal toUpper
		sb $v0, ($a1)	
		addi $a1, $a1, 1
		addi $a2, $a2, 1
		
		jal advance_word
		
		addi $a3, $a3, 4
		and $s1, $s1, $0
		j loopz

stop:
	jr $s7

advance_word:
	li $t3, 32
	li $t4, 47
	lb $t5, ($s6)
	loop:
		beq $t5, $t3, continue
		addi $s6, $s6, 1
		and $t5, $t5, $0
		lb $t5, ($s6)
		j loop
	continue:
		addi $s6, $s6, 1
		move $v0, $s6
		jr $ra 
	
skip:
	jal advance_word
	addi $a3, $a3, 4
	j loopz

##############################
# PART 2 FUNCTIONS
##############################

genBacon:
	#Define your code here

	###########################################
	# DELETE THIS CODE. Only to allow main program to run without fully implementing the function
	la $t2, ($a1)
	la $t9, ($a0)
	la $s4, ($ra)
	genBacon_loop:
		and $t1, $t1, $0
		lb $t1, ($t9)
		move $a0, $t1
		jal toUpper
		move $t1, $v0
		beq $t1, 65, A
		beq $t1, 66, B
		beq $t1, 67, C
		beq $t1, 68, D
		beq $t1, 69, E
		beq $t1, 70, F
		beq $t1, 71, G
		beq $t1, 72, H
		beq $t1, 73, I
		beq $t1, 74, J
		beq $t1, 75, K
		beq $t1, 76, L
		beq $t1, 77, M
		beq $t1, 78, N
		beq $t1, 79, O
		beq $t1, 80, P
		beq $t1, 81, Q
		beq $t1, 82, R
		beq $t1, 83, S
		beq $t1, 84, T
		beq $t1, 85, U
		beq $t1, 86, B
		beq $t1, 87, W
		beq $t1, 88, X
		beq $t1, 89, Y
		beq $t1, 90, Z
		beq $t1, 33, EXP
		beq $t1, 32, SP
		beq $t1, 46, PD
		beq $t1, 39, APO
		beq $t1, 44, COM
		beqz $t1, EOM
		
	next_char:
		addi $t9, $t9, 1
		j genBacon_loop	
	A:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char
	B:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1		
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		j next_char
	C:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1		
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char
	D:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1		
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1	
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		j next_char
	E:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1		
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1		
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char
	F:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1		
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		j next_char		
	G:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1		
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char 
	H:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1		
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		j next_char
	I:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1		
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char 	
	J:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1		
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		j next_char
	K:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char
	L:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		j next_char
	M:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char 
	N:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		j next_char 
	O:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char 
	P:
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		j next_char 
	Q:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char
	R:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1	
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		j next_char 
	S:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char
	T:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		j next_char
	U:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char 
	V:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		j next_char
	W:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char
	X:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		j next_char
	Y:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char
	Z:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		j next_char
	SP:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char
	EXP:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		j next_char
	APO:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char
	COM:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		j next_char
	PD:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a2, ($a1)			#A
		addi $a1, $a1, 1
		j next_char
	EOM:
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
		sb $a3, ($a1)			#B
		addi $a1, $a1, 1
	
	end_genBacon:
	la $a0, ($t2)
	jal countChars
	
	move $v1, $v0
	la $v0, ($t2)
	
	###########################################
	############################################
	jr $s4

hideEncoding:
	#la $a0, hideEncoding_baconEncoding	the BABABABBA...
	#la $a1, hideEncoding_text Whenever students pro...
	#li $a2, 'B'
	#li $a3, 65
	#jal hideEncoding
	la $sp, ($ra)
	
	la $s5, ($a0)		#s5 or a0 is the encoding 
	la $s6, ($a1)
	move $a0, $a1
	jal toLower
	move $a1, $v0		#now everything should be lowercase 
	
	la $a0, ($s5)
	
	loop_hideEncoding:
	lb $t0, ($a1)		#a1 is text. t0 now contains the first letter of the text  
	lb $t1, ($a0)		#t1 has the first letter of the encoding
	blt $t0, 64, skip_space
	beq $t1, $a2, makeUp
	
	j next_hideEncoding
	
	makeUp:
	la $s7, ($a0)
	move $a0, $t0
	jal toUpper
	move $t0, $v0 
	la $a0, ($s7)
	sb $t0, ($a1)
	
	
	next_hideEncoding:
	addi $a1, $a1, 1	#s6	text
	addi $a0, $a0, 1	#s5	encoding
	
	
	beqz $t0, end_hideEncoding
	beqz $t1, end_hideEncoding
	
	j loop_hideEncoding
	
	end_hideEncoding:
	move $a0, $s6
	jal countChars
	move $t0, $v0		#length of text
	
	move $a0, $s5
	jal countChars
	move $t1, $v0		#length of encoding
	
	
	move $v0, $t1
	j endend
	
	endend:
	ble $t1, $a3 true_hideEncoding
	li $v1, 0
	jr $sp
	
	true_hideEncoding:
	li $v1, 1
	jr $sp
	
	skip_space:
	addi $a1, $a1, 1 
	beqz $t0, end_hideEncoding
	beqz $t1, end_hideEncoding
	j loop_hideEncoding
	
	
findEncoding:
	#Define your code here
	#la $a0, findEncoding_baconEncoding
	#la $a1, findEncoding_text
	#li $a2, 'B'
	#li $a3, 100
	#jal findEncoding
	
	
	la $sp, ($ra)
	la $s7, ($a0)
	li $t0, 'x'
	and $t1, $t1, $0
	
	findEncoding_loop:
	lb $t1, ($a1)
	blt $t1, 65, next_in_text
	blt $t1, 91, makeB
	blt $t1, 97, next_in_text
	bgt $t1, 122, next_in_text
	
	j makeA
	
	makeB:
	sb $a2 ($a0)
	j next_findEncoding
	
	makeA:
	sb $t0, ($a0)
	j next_findEncoding
	
	next_findEncoding:
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	
	beqz $t1, end_findEncoding
	j findEncoding_loop
	
	next_in_text:
	addi $a1, $a1, 1
	
	la $s6, ($a0)
	move $a0, $s7
	jal countChars
	move $a0, $s6
	
	bgt $v0, $a3, findEncoding_overflow
	beqz $t1, end_findEncoding
	
	j findEncoding_loop
	
	findEncoding_overflow:
	li $v1, 0
	jr $sp
	
	end_findEncoding:
	move $a0, $s7
	jal countChars
	move $a0, $s7
	
	li $t0, 5
	div $v0, $t0
	mfhi $t0
	beqz $t0, divByfive
	li $v1, 0
	jr $sp
	
	divByfive:
	li $v1, 1
	jr $sp
	
	
decodeBacon:
	#Define your code here
	#la $a0, decodeBacon_baconEncoding
	#li $a1, 'B'
	#la $a2, decodeBacon_text
	#li $a3, 100
	#jal decodeBacon
	la $sp, ($ra)
	lw $s0, decipher
	la $s1, ($a2)
	li $t1, 0		#counter for 5 intervals 
	li $s2, 0		#counter for # characters 
	loop_decode:
	lb $t0, ($a0)
		
	
	beq $t1, 0, first_letter
	beq $t1, 1, second_letter
	beq $t1, 2, third_letter
	beq $t1, 3, fourth_letter
	beq $t1, 4, fifth_letter
	beq $t1, 5, enter_decoded_text
	
	first_letter:
	beq $t0, $a1, first_letterB
	j next_decode
	second_letter:
	beq $t0, $a1, second_letterB
	j next_decode
	third_letter:
	beq $t0, $a1, third_letterB
	j next_decode
	fourth_letter:
	beq $t0, $a1, fourth_letterB
	j next_decode
	fifth_letter:
	beq $t0, $a1, fifth_letterB
	j next_decode
	
	
	
	
	first_letterB:
	ori $s0, $s0, 16
	j next_decode
	second_letterB:
	ori $s0, $s0, 8
	j next_decode
	third_letterB:
	ori $s0, $s0, 4
	j next_decode
	fourth_letterB:
	ori $s0, $s0, 2
	j next_decode
	fifth_letterB:
	ori $s0, $s0, 1
	j next_decode
	
	next_decode:
	addi $t1, $t1, 1		#increment counter
	addi $a0, $a0, 1		#increment encoding
	beq $s2, $a3, end_decode	#as long as its not past buffer length
	bnez $t0, loop_decode
	j end_decode
	
	enter_decoded_text:
	
	beq $s0, 0, decodeA
	beq $s0, 1, decodeB
	beq $s0, 2, decodeC
	beq $s0, 3, decodeD
	beq $s0, 4, decodeE
	beq $s0, 5, decodeF
	beq $s0, 6, decodeG
	beq $s0, 7, decodeH
	beq $s0, 8, decodeI
	beq $s0, 9, decodeJ
	beq $s0, 10, decodeK
	beq $s0, 11, decodeL
	beq $s0, 12, decodeM
	beq $s0, 13, decodeN
	beq $s0, 14, decodeO
	beq $s0, 15, decodeP
	beq $s0, 16, decodeQ
	beq $s0, 17, decodeR
	beq $s0, 18, decodeS
	beq $s0, 19, decodeT
	beq $s0, 20, decodeU
	beq $s0, 21, decodeV
	beq $s0, 22, decodeW
	beq $s0, 23, decodeX
	beq $s0, 24, decodeY
	beq $s0, 25, decodeZ
	beq $s0, 26, decodeSP
	beq $s0, 27, decodeEXP
	beq $s0, 28, decodeAPO
	beq $s0, 29, decodeCOM
	beq $s0, 30, decodePD
	beq $s0, 31, decodeEOM
	
	
	decodeA:
	li $t2, 'A'
	sb $t2, ($a2)
	j next_five
	decodeB:
	li $t2, 'B'
	sb $t2, ($a2)
	j next_five
	decodeC:
	li $t2, 'C'
	sb $t2, ($a2)
	j next_five
	decodeD:
	li $t2, 'D'
	sb $t2, ($a2)
	j next_five
	decodeE:
	li $t2, 'E'
	sb $t2, ($a2)
	j next_five
	decodeF:
	li $t2, 'F'
	sb $t2, ($a2)
	j next_five
	decodeG:
	li $t2, 'G'
	sb $t2, ($a2)
	j next_five
	decodeH:
	li $t2, 'H'
	sb $t2, ($a2)
	j next_five
	decodeI:
	li $t2, 'I'
	sb $t2, ($a2)
	j next_five
	decodeJ:
	li $t2, 'J'
	sb $t2, ($a2)
	j next_five
	decodeK:
	li $t2, 'K'
	sb $t2, ($a2)
	j next_five
	decodeL:
	li $t2, 'L'
	sb $t2, ($a2)
	j next_five
	decodeM:
	li $t2, 'M'
	sb $t2, ($a2)
	j next_five
	decodeN:
	li $t2, 'N'
	sb $t2, ($a2)
	j next_five
	decodeO:
	li $t2, 'O'
	sb $t2, ($a2)
	j next_five
	decodeP:
	li $t2, 'P'
	sb $t2, ($a2)
	j next_five
	decodeQ:
	li $t2, 'Q'
	sb $t2, ($a2)
	j next_five
	decodeR:
	li $t2, 'R'
	sb $t2, ($a2)
	j next_five
	decodeS:
	li $t2, 'S'
	sb $t2, ($a2)
	j next_five
	decodeT:
	li $t2, 'T'
	sb $t2, ($a2)
	j next_five
	decodeU:
	li $t2, 'U'
	sb $t2, ($a2)
	j next_five
	decodeV:
	li $t2, 'V'
	sb $t2, ($a2)
	j next_five
	decodeW:
	li $t2, 'W'
	sb $t2, ($a2)
	j next_five
	decodeX:
	li $t2, 'X'
	sb $t2, ($a2)
	j next_five
	decodeY:
	li $t2, 'Y'
	sb $t2, ($a2)
	j next_five
	decodeZ:
	li $t2, 'Z'
	sb $t2, ($a2)
	j next_five
	decodeSP:
	li $t2, ' '
	sb $t2, ($a2)
	j next_five
	decodeEXP:
	li $t2, '!'
	sb $t2, ($a2)
	j next_five
	decodeAPO:
	li $t2, 39
	sb $t2, ($a2)
	j next_five
	decodeCOM:
	li $t2, ','
	sb $t2, ($a2)
	j next_five
	decodePD:
	li $t2, '.'
	sb $t2, ($a2)
	j next_five
	decodeEOM:
	
	addi, $a2, $a2, 1
	sb $0, ($a2)
	addi $s2, $s2, 1
	move $v0, $s2
	li $v1, 1
	jr $sp
	
	next_five:
	li $t1, 0
	andi $s0, $s0, 0
	addi, $a2, $a2, 1
	addi, $s2, $s2, 1
	
	beq $s2, $a3, end_decode	#as long as its not past buffer length
	bnez $t0, loop_decode
	
	end_decode:
	addi $s2, $s2, 1
	move $v0, $s2
	li $v1, 0
	
	jr $sp
	

.data
	#Define your memory here 
	
decipher: .word 0
