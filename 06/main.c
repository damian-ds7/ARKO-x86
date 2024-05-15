#include <stdio.h>
#include "f.h"

int main(int argc, char* argv[]) {
	if(argc < 4){
		printf("3 arguments are needed: string, a and b!\n");
		return -1;
	}

	f(argv[1], *argv[2], *argv[3]);
	printf("%s", argv[1]);
	printf("\n");
	return 0;
}