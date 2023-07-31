
# Zheyuan Gao
#
# Assembly code to read an input file through redirection and output the decrypted
# output to output file through redirection

.section .rodata

str1: 
    .string "%c"

.data

x: 
    .quad 7

.align 8

.globl main
    .type main, @function
.text
main:
	pushq %rbp
	movq %rsp, %rbp
	
	movq $0, %rbx               # %rbx used to detect if the amount of character is 7 
	subq $7, %rsp               # Allocating 7 characters array on stack
	movq %rsp, %r12             # Save the array pointer to %r12
	
test_i_equal_0:                 # If the i not equal to zero, means we are done.
    cmpq $0, %rbx
    jne finish
    
test_i_less_7:
    cmpq $7, %rbx               # If i==7, start decryption
    je test_i_equal_7
    
    movq $0, %rax               # Set return value to 0 before call getchar()
    call getchar
    cmpq $0xa, %rax              # If it is EOF, break the current loop
    je test_i_equal_7
    movb %al, (%r12, %rbx)      # Else store the character into the array
    incq %rbx                   # increment the index
    jmp test_i_less_7           # go back to test if the array is full
    
test_i_equal_7:
    cmpq $7, %rbx
    je decrypt                  # We got 7 chars, start decryption
    movq $0, %r13               # %r13=j as index register
    
test_j_i:
    cmpq %r13, %rbx
    je  finish                  # If index == arrayLength, we are done.
    movq (%r12, %r13), %rsi     # move array[index] is arg2 
    movq $str1, %rdi            # arg1 is "%c"
    movq $0, %rax               
    call printf
    
    incq %r13                   # j++
    jmp test_j_i
    
decrypt:
    movb $0, %dl               # %dl = target
    
    movq $0, %r15               # %r15 = count = 0 as index register
    
test_count_7:
    cmpq $7, %r15
    je  clean_i
    
    movb (%r12, %r15), %cl     # %cl = array[count]
    andb $128, %cl             # charCopy = target & 128, clean targetCopy except msb
    
    movq $0, %r11
shift_right_test:
    cmpq x, %r11
    je continue_decrypt
    shrb %cl                   # charCopy = charTemp >> (7 - count);
    incq %r11
    jmp shift_right_test
    
continue_decrypt:    
    orb %cl, %dl              # Restore target digit
    
    movq (%r12, %r15), %r10
    andq $127, %r10             # Clear the msb to 0
    
    movq $str1, %rdi
    movq %r10, %rsi
    movq $0, %rax
    call printf                 # print the encrypted digit
    
    incq %r15                   # count++
    decq x                      # x--
    jmp test_count_7
    
    
clean_i:
    movq $str1, %rdi
    movq %rcx, %rsi
    movq $0, %rax
    call printf                 # Print out the 8th digit
    
    movq $0, %rbx               # restore the value of i back to 0
	movq $7, x					
    jmp test_i_equal_0          # continue the loop to check next set of character



finish:
    movq $0, %rax   
    leave
    ret                         # Quit the program
    .size main,.-main
		
	
