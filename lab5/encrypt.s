# Zheyuan Gao
#
# Assembly code to read an input file through redirection and output the encrypted
# output to output file through redirection

.section .rodata

str1: 
    .string "%c"

.data

.align 8

.globl reverseBit       
    .type reverseBit, @function
reverseBit:                     # Function to reverse the bit of a character
    
    pushq %rbp
    movq %rsp, %rbp             # Handle the stack
    
    movq %rdi, %rax
    andq $15, %rdi
    salq $4, %rdi
    andq $240, %rax
    sarq $4, %rax
    orq %rdi, %rax              # c=(c&15)<<4|(c&240)>>4;
    
    movq %rax, %rdi
    
    andq $51, %rdi
    salq $2, %rdi
    andq $204, %rax
    sarq $2, %rax
    orq %rdi, %rax              # c=(c&51)<<2|(c&204)>>2;
    
    movq %rax, %rdi
    
    andq $85, %rdi
    salq $1, %rdi
    andq $170, %rax
    sarq $1, %rax
    orq %rdi, %rax              # c=(c&85)<<1|(c&170)>>1;
    
    
    
    leave
    ret                         # return
    
    

.globl main
    .type main, @function
.text
main:
	pushq %rbp
	movq %rsp, %rbp
	
	movq $0, %rbx               # %rbx used to detect if the amount of character is 8 
	subq $8, %rsp               # Allocating 8 characters array on stack
	movq %rsp, %r12             # Save the array pointer to %r12
	
test_i_equal_0:                 # If the i not equal to zero, means we are done.
    cmpq $0, %rbx
    jne finish
    
test_i_less_8:
    cmpq $8, %rbx               # If i==8, start decryption
    je test_i_equal_8
    
    movq $0, %rax               # Set return value to 0 before call getchar()
    call getchar
    cmpq $0xa, %rax              # If it is EOF, break the current loop
    je test_i_equal_8
    movb %al, (%r12, %rbx)      # Else store the character into the array
    incq %rbx                   # increment the index
    jmp test_i_less_8           # go back to test if the array is full
    
test_i_equal_8:
    cmpq $8, %rbx
    je encrypt                  # We got 8 chars, start encryption
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
    
encrypt:
    movq 7(%r12), %rdi
    call reverseBit             # reverse the bit pattern of encrypt digit
    movq %rax, %r14             # %r14 = target
    
    movq $0, %r15               # %r15 = count = 0 as index register
    
test_count_7:
    cmpq $7, %r15
    je  clean_i
    
    movq %r14, %r13             # %r13 = targetCopy
    andq $128, %r13             # targetCopy = target & 128, clean targetCopy except msb
    orq %r13, (%r12, %r15)      # charChunk[count] = (charChunk[count] | targetTemp)
    
    movq $str1, %rdi
    movq (%r12, %r15), %rsi
    movq $0, %rax
    call printf                 # print the encrypted digit
    
    salq %r14                   # left shift target one digit
    incq %r15                   # count++
    jmp test_count_7
    
    
clean_i:
    movq $0, %rbx               # restore the value of i back to 0
    jmp test_i_equal_0          # continue the loop to check next set of character



finish:
    movq $0, %rax   
    leave
    ret             # Quit the program
    .size main,.-main
	
	
	
