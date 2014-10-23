#! /bin/bash 

#En este script se va a copiar los datos de los usuarios previa comprobación  de que no hay conflicto.

pwFile="/home/joscormir/programming/grvcMigration/scripts/users/new_server/passwd"
pwFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/new_server/passwd.old"  

groupFile="/home/joscormir/programming/grvcMigration/scripts/users/new_server/group"
groupFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/new_server/group.old"

shadowFile="/home/joscormir/programming/grvcMigration/scripts/users/new_server/shadow"
shadowFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/new_server/shadow.old"

gshadowFile="/home/joscormir/programming/grvcMigration/scripts/users/new_server/gshadow"
gshadowFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/new_server/gshadow.old"

#comprobación de seguridad

if [ "$(whoami)" != "root" ]; then
	echo "Error: Debes ser root para ejecutar este archivo" >&2
	exit 1
fi

#Comprobación de coincidencias

var="$(awk -F'|' 'NR==FNR{c[$3]++;next};c[$3] > 0' $pwFile $pwFileUsers)" 

if [ -z "$var" ]; then 
	echo "no coincidences"
else
	echo $var
fi

