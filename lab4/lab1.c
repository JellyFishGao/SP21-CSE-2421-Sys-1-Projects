/* Zheyuan Gao */

#include <stdio.h>
#include "header.h"
#include <time.h>

int evenOrOdd(int x){
	return x%2==0 ? 1 : 0;
}

int main () {
	clock_t start, end;
	double cpu_time_used;
	int i = INIT, j;

	start = clock();
	
	printf("i=%d, ",i);
	j = evenOrOdd(i);
	j ? printf("which is even\n") : printf("which is odd\n");

	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("CPU time: %0.10f\n", cpu_time_used);
	/* Returning 0 to the system means all is good */
	return 0;
}



