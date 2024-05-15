CC = gcc
CFLAGS = -m32 -Wall
DFLAGS = -g -O0

all: main.o f.o
	$(CC) $(CFLAGS) main.o f.o -o fun

deb: main.o f.o
	$(CC) $(CFLAGS) $(DFLAGS) main.o f.o -o debug

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

f.o: f.s
	nasm -f elf f.s

clean:
	rm -f *.o
