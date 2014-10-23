#! /bin/bash 

pwFile="/home/joscormir/programming/grvcMigration/scripts/users/new_server/passwd"
pwFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/new_server/passwd.old"  

groupFile="/home/joscormir/programming/grvcMigration/scripts/users/new_server/group"
groupFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/new_server/group.old"

shadowFile="/home/joscormir/programming/grvcMigration/scripts/users/new_server/shadow"
shadowFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/new_server/shadow.old"

gshadowFile="/home/joscormir/programming/grvcMigration/scripts/users/new_server/gshadow"
gshadowFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/new_server/gshadow.old"


#----------------usuarios ---------------------------------#
	echo "copying passwd to new server..."
	cat $pwFileUsers >> $pwFile

#----------------grupos -----------------------------------#
	echo "copying group to new server..."
	cat $groupFileUsers >> $groupFile

#Hacemos lo mismo para el fichero de shadow con las contraseñas encriptadas, usando el mismo límite:

#----------------passwords --------------------------------#
	echo "copying shadow to new server..."
	cat $shadowFileUsers >> $shadowFile

#----------------group passwords --------------------------#
	echo "copying gshadow to new server..."
	cat $gshadowFileUsers >> $gshadowFile

