
all: ccall

camlcode.o: f.ml
	ocamlc -output-obj -o camlcode.o unix.cma f.ml

ccall: camlcode.o main.c
	gcc -o ccall camlcode.o main.c -L`ocamlc -where` -lunix -lcamlrun -ldl -lm -lncurses	

clean:
	rm -f *.o *.cmi *.cmo ccall
