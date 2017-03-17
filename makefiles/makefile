test: main
	./test
main: main.o
	ld -s -o main main.o
main.o: main.asm
	nasm -f elf64 main.asm
