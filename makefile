lrs: lrs.fas
	echo "clisp lrs.fas" > lrs
	chmod +x lrs
lrs.fas: lrs.lisp
	clisp -c lrs.lisp
test: lrs
	./lrs_test.sh
clean:
	rm lrs.fas lrs.lib
