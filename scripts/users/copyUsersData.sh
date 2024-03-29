#! /bin/bash
#Para empezar necestamos ir al /etc/passwd y ver donde empiezan las cuentas
#normales de usuario en el sistema de Debian. Es sabido que normalmente, los usuarios del sistema
#tienen valores por defecto de ID entre 0 y 499 y los de usuario normal van desde el 500 al 60000.
#Una vez encontrado esto podemos coger el ID (que es el de la tercera columna) para poner límite a nuestro comando
#No se exportaran usuarios o grupos por debajo de este limite.
#Tambien excluimos la cuenta "nobody" que tiene como ID el numero "65534" (confirmar)
#Metemos en limit el valor que encontramos en /etc/passwd de Debian

let limit=1000

#----------------------------------------------------------#

pwFile="/home/joscormir/programming/grvcMigration/scripts/users/passwd"
pwFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/passwd.old"  

groupFile="/home/joscormir/programming/grvcMigration/scripts/users/group"
groupFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/group.old"

shadowFile="/home/joscormir/programming/grvcMigration/scripts/users/shadow"
shadowFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/shadow.old"

gshadowFile="/home/joscormir/programming/grvcMigration/scripts/users/gshadow"
gshadowFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/gshadow.old"

#-----------comprobación de seguridad----------------------#

if [ "$(whoami)" != "root" ]; then
	echo "Error: Debes ser root para ejecutar este archivo" >&2
	exit 1
fi

#----------------usuarios ---------------------------------#

awk -v LIMIT=$limit -F: '($3>=LIMIT) && ($3!=65534)' $pwFile > $pwFileUsers

#----------------grupos -----------------------------------#
awk -v LIMIT=$limit -F: '($3>=LIMIT) && ($3!=65534)' $groupFile > $groupFileUsers

#Hacemos lo mismo para el fichero de shadow con las contraseñas encriptadas, usando el mismo límite:
#----------------passwords --------------------------------#

awk -v LIMIT=$limit -F: '($3>=LIMIT) && ($3!=65534) {print $1}' $pwFile | tee - | egrep -f - $shadowFile > $shadowFileUsers

#----------------group passwords --------------------------#

awk -v LIMIT=$limit -F: '($3>=LIMIT) && ($3!=65534) {print $1}' $groupFile | tee - | egrep -f - $gshadowFile > $gshadowFileUsers

#Ya tenemos todos los passwords copiados en nuestros ficheros en root ahora necesitamos comprobar que no hay conflictos
#antes de realizar ninguna copia
#por tanto hay que seguir los pasos de la wiki.

