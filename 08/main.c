#include <stdio.h>
#include "f.h"

int main(int argc, char* argv[]) {
	if(argc < 2){
		printf("Argument missing!\n");
		return -1;
	}

	int x = f(argv[1]);

	if (x == 0) {
		printf("No int found or int equal to 0.\n");
        return -1;
	}

    printf("Text: %s\nInt:  %d\n", argv[1], x);
	printf("\n");
	return 0;
}