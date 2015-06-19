#! /bin/bash

#aquí es donde se desarrolla el script para convertir de un charset a otro. 
#Por ejemplo de ISO88591 a UTF8
clear 

#-----------Necesitas ser root para ejecutar est script----------------------#

if [ "$(whoami)" != "root" ]; then
	echo "Error: Debes ser root para ejecutar este archivo" >&2
	exit 1
fi

#---------------------------------------------------------------------------------

read -r -p "Introduzca la ruta(absoluta) de la carpeta: " encodedDirectory

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

#---------------------------------------------------------------------------------

echo "Cambiando el encoding de los ficheros con extensión .html"

read -n1 -r -p "Presiona c para continuar o enter para saltar... " key
if [ "$key" = 'c' ]; then
	for file in *.html; do
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

#---------------------------------------------------------------------------------

echo "Cambiando el encoding de los ficheros con extensión .htm"

read -n1 -r -p "Presiona c para continuar o enter para saltar... " key
if [ "$key" = 'c' ]; then
	for file in *.htm; do
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

#---------------------------------------------------------------------------------

echo "Cambiando el encoding de los ficheros con extensión .shtml"

read -n1 -r -p "Presiona c para continuar o enter para saltar... " key
if [ "$key" = 'c' ]; then
	for file in *.shtml; do
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

#---------------------------------------------------------------------------------
