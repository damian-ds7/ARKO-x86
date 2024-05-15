#include <stdio.h>
#include "f.h"

int main(int argc, char* argv[]) {
	if(argc < 3){
		printf("Argument missing!\n");
		return -1;
	}

	int n;
	if (!sscanf(argv[2], "%d", &n))
		printf("wrong argument %d\n", 2);

	if (n < 0) {
		printf("N must be greater than 0\n");
		return -1;
	}
	f(argv[1], n);
	printf("%s", argv[1]);
	printf("\n");
	return 0;
}