#! /bin/bash

if [ "$1" = "-s" ]; # skip compilation
then
	java -cp . analizadorCSS fichero # execute without compiling
else
	cd .. && cp ./fuente/src/analizadorCSS.jj ./pruebas && \
	cd ./pruebas && javacc analizadorCSS.jj && javac *.java && java -cp . analizadorCSS fichero
fi
