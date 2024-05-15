#include <stdio.h>
#include <string.h>
#include "f.h"

int main(int argc, char* argv[]) {
	if(argc < 4){
		printf("Argument missing!\n");
		return -1;
	}
	if (strlen(argv[2]) > 1 || strlen(argv[3]) > 1) {
		printf("The second and third arguments must be single characters\n");
		return -1;
	}
	f(argv[1], *argv[2], *argv[3]);
	printf("%s", argv[1]);
	printf("\n");
	return 0;
}