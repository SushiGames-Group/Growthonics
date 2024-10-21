.PHONY: build run clean

build:
	mkdir -p build
	nasm -f elf64 -o build/main.o src/main.s
	nasm -f elf64 -o build/inputs.o src/inputs.s
	gcc -no-pie -nostartfiles -o game build/*.o -lSDL2

run: build
	./game

clean:
	rm -rf build 
	rm -f game
