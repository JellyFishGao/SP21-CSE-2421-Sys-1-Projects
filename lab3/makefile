#Zheyuan Gao

#How to use command line arguments for this program: 
#First argument: Enter 'y' to produce a balanced BST. An ordinary BST is produced for other character input.
#Second argument: Enter 'y' to read a file input. No file will be read for other characters input.
#Third argument: Provide the name of the input file if entered 'y' for second argument. Optional if not entered 'y' for second argument.
#Remark: Please enter exactly 2 or 3 arguments or the program will quit.

# Makefile for lab 1-4.

#change the last dependency for each new lab
all:  tags headers BST BBST cmdBST

#this entry has to change for lab 2 - 4
# NEVER compile .c files with this rule - it lacks needed compile time flags
# There is an entry below that turns .c files into .o files

#this entry produce executable binary search tree program
BST: BST.o 
	gcc -g -o $@ $^ 

#this entry produce executable balanced binary search tree program
BBST: BBST.o 
	gcc -g -o $@ $^ 

#this entry produce executable command line arguments BST program
cmdBST: cmdBST.o 
	gcc -g -o $@ $^ 

#this is where you create an entry to build your zip file
#it will also update with new labs
lab3.zip: makefile *.c *.h README BST.in
	zip lab3.zip makefile *.c *.h README BST.in
	# optional below here – remove old install folder
	rm –rf install
	# create the install folder
	mkdir install
	# unzip to the install folder
	unzip lab3.zip –d install
	# make ONLY the lab2 target, not lab2.zip
	make –C install lab3

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
%.o:%.c *.h
	gcc -ansi -pedantic -Wimplicit-function-declaration -Wreturn-type -g -c $< -o $@


