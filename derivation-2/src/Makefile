PREFIX ?= output

hello: hello.c
	gcc -Wall $< -o $@

install: hello
	install -D hello "${PREFIX}/bin/hello"
