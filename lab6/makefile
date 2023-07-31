#Zheyuan Gao

#makefile for assembly lab6 program
all:  lab6

#this is where you create an entry to build your zip file
#it will also update with new labs
lab6.zip: makefile *.s README 
	zip lab6.zip makefile *.s README 
	# optional below here – remove old install folder
	rm –rf install
	# create the install folder
	mkdir install
	# unzip to the install folder
	unzip lab6.zip –d install
	# make ONLY the lab5 target, not lab5.zip
	make –C install lab6

# There is an entry below that turns .s files into .o files

lab6: lab6.o
	gcc -g -o $@ $^

lab6.o: lab6.s
	gcc -g -c $^ -o $@
