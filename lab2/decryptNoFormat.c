/* Zheyuan Gao */
/* This program takes input file and decrypt and print it to another file. And 
this code has bad format. */
#include <stdio.h>
#include "customheader.h"

int main ()
{
    
    
int i, j, pos, count, i1;
    unsigned int charTemp;
    char key;
    char charChunk[MAXSIZE];
    i1 = 0;
    while(!i1){/* Implicit comparision */
        if(1) break;/* break statement and if construct without block */       
    }
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
			
			for(j = 0; j < i; j++){
            			printf("%c", charChunk[j]);
        		}
    		}else{
        		
			key = (char)0;
        		for(count = 0; count < DECRYUNIT; count++){
                		charTemp = charChunk[count];
                		
                		charTemp = charTemp & CLEAR;
                		
                		charTemp = charTemp >> (DECRYUNIT - count);
                		
                		key = key | charTemp;
                		
                		charChunk[count] = charChunk[count] & CLEARLEFT;
                		printf("%c", charChunk[count]);
         		}
            		
            		printf("%c", key);
			i = 0;
    		}
    }

    return 0;
}



