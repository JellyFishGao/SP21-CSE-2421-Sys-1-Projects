#Zheyuan Gao

#makefile for assembly encryption and decryption program
all:  encrypt decrypt

#this is where you create an entry to build your zip file
#it will also update with new labs
lab5.zip: makefile *.s README enIn rightOut deIn
	zip lab5.zip makefile *.s README enIn rightOut deIn
	# optional below here – remove old install folder
	rm –rf install
	# create the install folder
	mkdir install
	# unzip to the install folder
	unzip lab5.zip –d install
	# make ONLY the lab5 target, not lab5.zip
	make –C install lab5

# There is an entry below that turns .s files into .o files

encrypt: encrypt.o
	gcc -g -o $@ $^

encrypt.o: encrypt.s
	gcc -g -c $^ -o $@

decrypt: decrypt.o
	gcc -g -o $@ $^

decrypt.o: decrypt.s
	gcc -g -c $^ -o $@


