/* Zheyuan Gao */
/* This is the program to decrypt the encrypted input file and output it to another file. */
#include <stdio.h>
#include "customheader.h"

int main()
{
    	int i, j, pos, count;
    	unsigned int charTemp;
    	char key;/* key is the 8th character and charTemp can store the character in the array */
    	char charChunk[DECRYUNIT];/* 7 sized array to store input 7 characters in input file every time*/
    	i = 0;
	while(i == 0){
    		while(i < DECRYUNIT){
			if((charChunk[i] = (char)getchar()) == EOF){
				break;
			}else{
				i = i + 1;
			}       
    		}
    		if(i != DECRYUNIT){
			/*Output characters no need to encryption */
			for(j = 0; j < i; j++){
            			printf("%c", charChunk[j]);
        		}
    		}else{
        		/* Start decryption */
			key = (char)0;
        		for(count = 0; count < DECRYUNIT; count++){
                		charTemp = charChunk[count];
                		/* Clear other bits of charTemp leave the most significant bit intact */
                		charTemp = charTemp & CLEAR;
                		/* Left shift the most significant bit */
                		charTemp = charTemp >> (DECRYUNIT - count);
                		/* Restore the original bit back to the 8th character*/
                		key = key | charTemp;
                		/* Decrypt and print the first 7 character in input file */
                		charChunk[count] = charChunk[count] & CLEARLEFT;
                		printf("%c", charChunk[count]);
         		}
            		/* Print the key of the 7 characters before */
            		printf("%c", key);
			i = 0;
    		}
    }

    return 0;
}



