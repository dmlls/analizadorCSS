#! /bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

# prints help
function printHelp {
	echo -e "\n${bold}./run.sh${normal} [OPCIÓN] <FICHERO>\n"
	echo -e "${bold}OPCIONES:"
	echo -e "\t-s, --skip${normal}"
	echo -e "\t\tejecutar sin recompilar"
	echo -e "${bold}\n\t-h, --help${normal}"
	echo -e "\t\tobtener ayuda\n"
}

# prints error message when argument is missing
function missingArgError {
	echo -e "\n${bold}ERROR${normal}: Debe especificar el fichero a analizar.\n\n-"
	printHelp
}

cd ../fuente/src

if [ "$1" = "-h" -o "$1" = "--help" ]; # show help
then
	printHelp
elif [ "$1" = "-s" -o "$1" = "--skip" ]; # skip compilation
then
	if [ "$2" = "" ];
	then
		missingArgError
	else
		java -cp . analizadorCSS ../../pruebas/"$2" # execute without compiling
	fi
else
	if [ "$1" = "" ];
	then
		missingArgError
	else
		javacc analizadorCSS.jj && javac *.java && java -cp . analizadorCSS ../../pruebas/"$1"
	fi
fi