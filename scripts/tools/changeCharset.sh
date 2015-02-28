#! /bin/bash

#aquí es donde se desarrolla el script para convertir de un charset a otro. Por ejemplo de ISO88591 a UTF8

#Este primer if lo que hace es cerciorarse de que se está introduciendo la información de manera exacta, es decir, al llamar al script debe recibir un directorio de destino, el orginal encoding y el encoding de destino
if [ $# -ne 3 ]; then
	echo “No lo estás usando bien: “$0″ directorio_destino + encoding_original + encoding_deseado”
	exit
fi;

#Aqui se extraen las tres partes a tratar

dir=$1
from=$2
to=$3

#Si no existe el directorio, se crea

if [ ! -d $dir ]; then
mkdir $dir
fi

#Bucle donde se hace la conversión de todos los archivos de la carpeta

for f in $( ls . ); do
	if [ -f $f ]; then
		iconv -f $from -t $to $f > $dir$f
	fi
done
