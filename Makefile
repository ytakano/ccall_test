include Makefile.include

include $(FSTAR_HOME)/ulib/ml/Makefile.include

all: test.o

test.ml: out test.fst
	$(FSTAR) $(FSTAR_DEFAULT_ARGS) --odir out --codegen OCaml --extract 'test' test.fst --record_hints

out:
	mkdir -p out

test.o: test.ml
	ocamlfind ocamlopt -I $(FSTAR_HOME)/bin/fstarlib -linkpkg -package ppx_deriving,ppx_deriving_yojson,zarith,unix -output-obj -o test.o fstarlib.cmxa out/Test.ml

clean:
	rm -rf out *~ *.exe *.hints *.o
