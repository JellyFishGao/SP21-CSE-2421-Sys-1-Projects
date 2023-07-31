#Zheyuan Gao

# Makefile for lab 4.

#change the last dependency for each new lab
all: lab1pg encryptpg cmdBSTpg

#this entry has to change for lab 2 - 4
# NEVER compile .c files with this rule - it lacks needed compile time flags
# There is an entry below that turns .c files into .o files

#this entry produce executable lab1 program
lab1: lab1.o 
	gcc -g -o $@ $^ 
lab1Nog: lab1.o 
	gcc -o $@ $^ 
lab1O: lab1.o 
	gcc -O -o $@ $^ 
lab1O3: lab1.o 
	gcc -O3 -o $@ $^ 
lab1pg: lab1.o 
	gcc -O -pg -o $@ $^ 

#this entry produce executable encrypt program
encrypt: encrypt.o 
	gcc -g -o $@ $^ 
encryptNog: encrypt.o 
	gcc -o $@ $^ 
encryptO: encrypt.o 
	gcc -O -o $@ $^ 
encryptO3: encrypt.o 
	gcc -O3 -o $@ $^ 
encryptpg: encrypt.o 
	gcc -O -pg -o $@ $^ 

#this entry produce executable command line BST program
cmdBST: cmdBST.o 
	gcc -g -o $@ $^ 
cmdBSTNog: cmdBST.o 
	gcc -o $@ $^ 
cmdBSTO: cmdBST.o 
	gcc -O -o $@ $^ 
cmdBSTO3: cmdBST.o 
	gcc -O3 -o $@ $^ 
cmdBSTpg: cmdBST.o 
	gcc -O -pg -o $@ $^ 

#this is where you create an entry to build your zip file
#it will also update with new labs
lab4.zip: makefile *.c *.h README lab1out enIn1 enIn2 enOut1 enOut2 BSTin1 BSTin2 BSTout1 BSTout2
	zip lab4.zip makefile *.c *.h README lab1out enIn1 enIn2 enOut1 enOut2 BSTin1 BSTin2 BSTout1 BSTout2
	# optional below here – remove old install folder
	rm –rf install
	# create the install folder
	mkdir install
	# unzip to the install folder
	unzip lab2.zip –d install
	# make ONLY the lab2 target, not lab2.zip
	make –C install lab2

#this entry stays for C code labs
tags: *.c
	ctags -R .

# this entry stays for C code labs
headers: *.c tags
	headers.sh


# this entry takes care of C files depending on header files
# It has the flags for compiling the c code
# It you don't like makefiles, consider typing the following line a few
# thousand times this semester and reconsider.
# Be sure that this one doesn't get an inserted line break anywhere

#Default compile command flags (with -g)
#%.o:%.c *.h
#	gcc -ansi -pedantic -Wimplicit-function-declaration -Wreturn-type -g -c $< -o $@

#Compile command without -g
#%.o:%.c *.h
#	gcc -ansi -pedantic -Wimplicit-function-declaration -Wreturn-type -c $< -o $@

#Compile command with -O flag
#%.o:%.c *.h
#	gcc -ansi -pedantic -Wimplicit-function-declaration -Wreturn-type -O -c $< -o $@

#Compile command with -O3 flag
#%.o:%.c *.h
#	gcc -ansi -pedantic -Wimplicit-function-declaration -Wreturn-type -O3 -c $< -o $@

#Compile command with -O and -pg flag
%.o:%.c *.h
	gcc -ansi -pedantic -Wimplicit-function-declaration -Wreturn-type -O -pg -c $< -o $@



