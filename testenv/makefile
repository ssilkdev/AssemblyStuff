test: main
	bash test

main: main.o
	ld -m elf_i386 -s -o main main.o
main.o: main.asm
	nasm -f elf -l main.lst main.asm
