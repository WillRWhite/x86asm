# Makefile works with Linux gcc
# install gcc and gdb

.PHONY: clean

myhello: myhello.s myhello.o
	gcc -c -g myhello.s
	ld myhello.o -o myhello

hello: hello.s hello.o
	gcc -c -g hello.s
	ld hello.o -o hello

clean:
	rm -f hello
	rm -f hello.o
	rm -f myhello
	rm -f myhello.o
