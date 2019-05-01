# A Sample Program to try out MIPS ISA Instructions

# Computing the following expressions and store in registers:
# expression1: nLet + myId                          ----> store in $t1
# expression2: nLet - myId                          ----> store in $t2
# expression3: nLet * 4 in $t3                      ----> store in $t3
# expression4: even adjust(nLet + myId) /2          ----> store in $t4
#       transform expression4 to even by subtracting 1 if odd

################################################################################
        .data
myId:   .word   36      # storing int 36 as a 32 bitword in the myId location
nLet:   .word   5       # Storing int 5 as a 32 bit word in the nLet location
disp1:  .asciiz "My family name is Singh\n"	
disp2:  .asciiz "My Student ID is 20379870\n"
disp3:  .asciiz "The value of myId is 36\n"
disp4:  .asciiz "The number of characters in my last name is 5\n"


        .text
main:
        lw $s0, myId          # load the register $s0  with the value at myId
        lw $s1, nLet          # load the register $s1 with value at nLet
        add $t1, $s1, $s0     # load register $t1 with the value of expression1
        sub $t2, $s1, $s0     # load register $t2 with the value of expression2
        sll $t3, $s1, 2       # load register $t3 with the value of expression3
        andi $t5, $t1, 1      # store a 1 or 0 in $t5 depending on if the least 
                              # significant bit of $t1 is 1 (odd) or 0 (even) by
                              # comparing it to constant 1 with AND operator
        bne $t5, $zero, isOdd # jump to branch isOdd if $t5 is not 0
        srl $t4, $t1, 1       # if code did not jump to isOdd, load register $t1
                              # with value of expression4
	j doPrint             # jump to the doPrint branch
isOdd: 
        sub $t6, $t1, 1       # the original sum is odd ,so subtract 1
   			      # load register $t6 with the new even number
   	srl $t4, $t6, 1       # load register $t4 with the even adjusted 
                              # value of expression4
        j doPrint             # jump to the doPrint branch
doPrint:
        la $a0, disp1         # load the addr of disp1 into $a0.
	li $v0, 4             # 4 is the print_string syscall.
	syscall               # do the syscall.
	la $a0, disp2         # load the addr of disp2 into $a0.
	li $v0, 4             # 4 is the print_string syscall.
	syscall               # do the syscall.
	la $a0, disp3         # load the addr of disp3 into $a0.
	li $v0, 4             # 4 is the print_string syscall.
	syscall               # do the syscall.
	la $a0, disp4         # load the addr of disp4 into $a0.
	li $v0, 4             # 4 is the print_string syscall.
	syscall               # do the syscall.
        li $v0, 10            # 10 is the exit syscall.
	syscall               # do the syscall