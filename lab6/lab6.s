# Zheyuan Gao
#
# Assembly program to determine the longest string, most wordy string, and first
# string appear in lexicographical order. And print them to the console. 

.section .rodata

str1:
    .string "I’m big fan of small word. No like big word or good grammar. Grammar too hard." 

str2: 
    .string "I really hate how nice the weather is getting."
    
str3:
    .string "What"

str4:
    .string "Amazing, isn’t it? With just the slightest touch the material warps around the skin effortlessly."
    
str5:
    .string "Can you believe how much ligma is going around this year?"

newLine:
    .string "\n"

longestStr:
    .string "The longest string is:\n"
    
mostWordyStr:
    .string "The string contain most words is:\n"
    
strInLexicon:
    .string "The string appear first in lexicographical order is:\n"
    
    
.data

.align 8

.globl find_longest
    .type find_longest,@function
find_longest:
    pushq %rbp
	movq %rsp, %rbp
    
    
    cmpq $0, %rsi
    jle Program_Quit
    
    movq %rdi, %rdx                     # %rdx is array 
    decq %rsi                           # %rsi is index register
    
    movq (%rdx, %rsi, 8), %rdi
    movq $0, %rax
    pushq %rsi
    pushq %rdx
    pushq %rcx
    pushq %r8
    call strlen
    popq %r8
    popq %rcx
    popq %rdx
    popq %rsi
    movq %rax, %rcx                     # %rcx store the length of current longest string
    movq %rsi, %r8                      # %r8 store the index of current longest string

compare_index_0:    
    cmpq $0, %rsi
    jl  print_longest
    
    
    movq (%rdx, %rsi, 8), %rdi
    movq $0, %rax
    pushq %rsi
    pushq %rdx
    pushq %rcx
    pushq %r8
    call strlen
    popq %r8
    popq %rcx
    popq %rdx
    popq %rsi
    cmpq %rax, %rcx
    jge decrement_index
    movq %rax, %rcx
    movq %rsi, %r8
    
decrement_index:
    decq %rsi
    jmp compare_index_0

print_longest:
    movq (%rdx, %r8, 8), %rdi
    movq $0, %rax
    call printf
    
    leave 
    ret
    
    
    
.globl find_wordy
    .type find_wordy, @function
find_wordy:
    pushq %rbp
    movq %rsp, %rbp
    
    cmpq $0, %rsi                       # No string provided, quit.
    jle Program_Quit
    
    decq %rsi                           # %rsi is index pointer for string array
    movq %rsi, %r11                     # %r11 is the index of currently most wordy string
    movq $0, %r9                        # %r9 store the current largest number of words in string

compare_rsi_0:
    cmpq $0, %rsi
    jl print_wordy
    
    movq (%rdi, %rsi, 8), %rdx          # %rdx is the characetr array (particular string)
    movq $0, %rcx                       # %rcx is the index poniter for character array
    movq $0, %r8                        # %r8 will store the number of space in string
    
compare_rdx_null:
    cmpb $0x0, (%rdx,%rcx,1) 
    je decrement_rsi
    cmpb $0x20, (%rdx,%rcx,1)
    jne increment_rcx
    incq %r8
increment_rcx:
    incq %rcx
    jmp compare_rdx_null
    
    
decrement_rsi:
    cmpq %r8, %r9
    jge jump_to_compare_rsi_0
    movq %r8, %r9
    movq %rsi, %r11
jump_to_compare_rsi_0:
    decq %rsi
    jmp compare_rsi_0
    

print_wordy:
    movq (%rdi, %r11, 8), %rdi
    pushq %r9
    movq $0, %rax
    call printf
    popq %r9
    incq %r9
    movq %r9, %rax
    
    leave 
    ret


.globl find_lexicographic
    .type find_lexicographic, @function
find_lexicographic:
    pushq %rbp
	movq %rsp, %rbp
	
    cmpq $0, %rsi                       # No string provided, quit.
    jle Program_Quit
    
    movq %rdi, %rdx                     # %rdx is array 
    decq %rsi                           
    movq %rsi, %rcx                     # %rcx is index register
    movq %rcx, %r8                      # %r8 store the index of current first string in lexicographical order
    
compare_rcx_0:
    cmpq $0, %rcx
    jl  print_first
    
    movq (%rdx, %rcx, 8), %rdi
    movq (%rdx, %r8, 8), %rsi
    movq $0, %rax
    pushq %rdx
    pushq %rcx
    pushq %r8
    call strcmp
    popq %r8
    popq %rcx
    popq %rdx
    
    jge decrement_rcx
    movq %rcx, %r8
    
decrement_rcx:
    decq %rcx
    jmp compare_rcx_0
    
    
    
print_first:
    movq (%rdx, %r8, 8), %rdi
    movq $0, %rax
    call printf
    
    leave 
    ret
    
    

.globl main
    .type main, @function
.text

main:
	pushq %rbp
	movq %rsp, %rbp
	
	subq $40, %rsp                      # Change the 40 to (8*number of string) to allocating more space for pointer array on stack
	movq %rsp, %rbx
	movq $5, %r12                       # Change the number 5 here to the total number of string 
	
    movq $0, %r13
	movq $str1, (%rbx,%r13,8)
    
    incq %r13
    movq $str2, (%rbx,%r13,8)
    
    incq %r13
    movq $str3, (%rbx,%r13,8)
    
    incq %r13
    movq $str4, (%rbx,%r13,8)
    
    incq %r13
    movq $str5, (%rbx,%r13,8)           # Add more or delete some of these sections of code if number of strings is changed  

    movq $longestStr, %rdi
    movq $0, %rax
    call printf
    
    movq %rbx, %rdi
    movq %r12, %rsi
    call find_longest
    
    movq $newLine, %rdi
    movq $0, %rax
    call printf
    movq $newLine, %rdi
    movq $0, %rax
    call printf
    
    movq $mostWordyStr, %rdi
    movq $0, %rax
    call printf
    
    movq %rbx, %rdi
    movq %r12, %rsi
    call find_wordy

    movq $newLine, %rdi
    movq $0, %rax
    call printf
    movq $newLine, %rdi
    movq $0, %rax
    call printf
    
    movq $strInLexicon, %rdi
    movq $0, %rax
    call printf
    
    movq %rbx, %rdi
    movq %r12, %rsi
    call find_lexicographic

    movq $newLine, %rdi
    movq $0, %rax
    call printf
    
      
Program_Quit:    
	movq $0, %rax
	leave
	ret
	.size main,.-main
	
