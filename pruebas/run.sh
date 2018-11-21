#! /bin/bash

cd ../fuente/src
if [ "$1" = "-s" ]; # skip compilation
then
	java -cp . analizadorCSS ../../pruebas/fichero # execute without compiling
else
	javacc analizadorCSS.jj && javac *.java && java -cp . analizadorCSS ../../pruebas/fichero
fi