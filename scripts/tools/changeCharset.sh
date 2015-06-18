#! /bin/bash

#aquí es donde se desarrolla el script para convertir de un charset a otro. 
#Por ejemplo de ISO88591 a UTF8
clear 

read -r -p "introduzca la ruta(absoluta) de la carpeta cambio de charset: " encodedDirectory

cd $encodedDirectory

read -r -p "Introduzca el charset que quiera sustituir: " fromCharset

read -r -p "Introduzca el nuevo charset: "  toCharset

#---------------------------------------------------------------------------------

echo "Cambiando el encoding de los ficheros con extensión .php"

read -n1 -r -p "Presiona c para continuar o enter para saltar... " key
if [ "$key" = 'c' ]; then
	for file in *.php; do
		if [ `file -i "$file" | awk '{print $3;}'` = "charset=$fromCharset" ]; then
			iconv -f $fromCharset -t $toCharset "$file" > "u.$file"
			fileName=$file
        	rm -f $file
        	mv u.$file $fileName
			echo "Convertido $fileName"
        fi

	done
else
	echo "has saltado el bloque"
fi

#Hay que repetir este bloque con todos los tipos de archivos 
#Hay que hacer que trate archivos de manera recursiva
