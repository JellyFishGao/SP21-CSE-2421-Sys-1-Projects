#Zheyuan Gao

# Makefile for lab 1-4.

#change the last dependency for each new lab
all:  tags headers encrypt decrypt deBadFormat

#this entry has to change for lab 2 - 4
# NEVER compile .c files with this rule - it lacks needed compile time flags
# There is an entry below that turns .c files into .o files

#this entry produce executable encrypt program
encrypt: encrypt.o 
	gcc -g -o $@ $^ 

#this entry produce executable decrypt program
decrypt: decrypt.o 
	gcc -g -o $@ $^ 

#this entry produce executable decrypt bad format program
deBadFormat: decryptNoFormat.o 
	gcc -g -o $@ $^ 

#this is where you create an entry to build your zip file
#it will also update with new labs
lab2.zip: makefile *.c *.h README encryptExpect.out
	zip lab2.zip makefile *.c *.h README encryptExpect.out
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
%.o:%.c *.h
	gcc -ansi -pedantic -Wimplicit-function-declaration -Wreturn-type -g -c $< -o $@


