/* Zheyuan Gao */
/* This program takes an input file and encrypt and output it to another file */
#include <stdio.h>
#include <stdlib.h>
#include "header.h"
#include <time.h>


/* Function to reverse bits of a character */
char reverseBit(char c){
    c = (c & 15) << 4 | (c & 240) >> 4;
    c = (c & 51) << 2 | (c & 204) >> 2;
    c = (c & 85) << 1 | (c & 170) >> 1;
    return c;
}

int main() {
    clock_t start, end;
    double cpu_time_used;
    int i, j, pos, count;
    unsigned int target, targetTemp; /* The every UNIT'th character use to encrypt other characters */
    char charChunk[UNIT];/* 8 sized Array to store input 8 character every time */
    /* Store the input character in array */

    start = clock();
    i = 0;
    while(i == 0){
    	while(i < UNIT){
        	if((charChunk[i] = (char)getchar()) == EOF){
			break;
		}else{
			/* Reach the end of the file without get 8 character */
			i = i + 1;
		}
		
    	}
    	if(i != UNIT){
        	/* Output characters in the output file no need to encryption */   
        	for(j = 0; j < i; j++){
            		printf("%c", charChunk[j]);
        	}

    	}else{
        	/* Start encryption */
        	pos = UNIT - 1; 
            	target = charChunk[pos];
            	target = reverseBit(target);
            	for(count = 0 ; count < pos; count++){
                	/* Creat a copy of the revered target with all digit cleared 
                	except for the first digit */
                	targetTemp = target & CLEAR;
                	/* Append first digit to the begining of the char been encrypted */
                	charChunk[count] = (charChunk[count] | targetTemp);
                	/* Print the encrypted text to the ouput file */
                	printf("%c", charChunk[count]);
                	target = target << 1;
        	}
		i = 0;
        }
        
    }

    end = clock();
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("\nCPU time: %0.10f\n", cpu_time_used);
  
    return 0;
}

