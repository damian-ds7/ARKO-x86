#include <stdio.h>
#include "f.h"

int main(int argc, char* argv[]) {
	if(argc < 2){
		printf("Argument missing!\n");
		return -1;
	}

	f(argv[1]);
	printf("%s", argv[1]);
	printf("\n");
	return 0;
}