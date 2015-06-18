#! /bin/bash

#aquí es donde se desarrolla el script para convertir de un charset a otro. 
#Por ejemplo de ISO88591 a UTF8
clear 

read -r -p "introduzca la ruta de la carpeta cambio de charset" encodedDirectory

read -r -p "Introduzca el charset que quiera sustituir" fromCharset

read -r -p "Introduzca el nuevo charset"  toCharset

#el script se ejecutará en la carpeta que se le diga

echo "Cambiando el encoding de los ficheros con extensión .html"

read -n1 -r -p "Presiona c para continuar o enter para saltar..." key
if [ "$key" = 'c' ]; then
	for file in $encodedDirectory/*
		do
  			file -i  $file 
		done
else
	echo "has saltado el bloque"
fi

##Este primer if lo que hace es cerciorarse de que se está introduciendo la información de manera exacta, es decir, al llamar al script debe recibir un directorio de destino, el orginal encoding y el encoding de destino
#if [ $# -ne 3 ]; then
#	echo “No lo estás usando bien: “$0″ directorio_destino + encoding_original + encoding_deseado”
#	exit
#fi;
#
##Aqui se extraen las tres partes a tratar
#
#dir=$1
#from=$2
#to=$3
#
##Si no existe el directorio, se crea
#
#if [ ! -d $dir ]; then
#mkdir $dir
#fi
#
##Bucle donde se hace la conversión de todos los archivos de la carpeta
#
#for f in $( ls . ); do
#	if [ -f $f ]; then
#		iconv -f $from -t $to $f > $dir$f
#	fi
#done
