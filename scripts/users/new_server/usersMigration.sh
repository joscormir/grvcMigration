pwFile="/home/joscormir/programming/grvcMigration/scripts/users/new_server/passwd"
pwFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/new_server/passwd.old"  

groupFile="/home/joscormir/programming/grvcMigration/scripts/users/new_server/group"
groupFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/new_server/group.old"

shadowFile="/home/joscormir/programming/grvcMigration/scripts/users/new_server/shadow"
shadowFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/new_server/shadow.old"

gshadowFile="/home/joscormir/programming/grvcMigration/scripts/users/new_server/gshadow"
gshadowFileUsers="/home/joscormir/programming/grvcMigration/scripts/users/new_server/gshadow.old"


#----------------usuarios ---------------------------------#

	cat $pwFileUsers >> $pwFile

#----------------grupos -----------------------------------#

	cat $groupFileUsers >> $groupFile

#Hacemos lo mismo para el fichero de shadow con las contraseñas encriptadas, usando el mismo límite:

#----------------passwords --------------------------------#

	cat $shadowFileUsers >> $shadowFile

#----------------group passwords --------------------------#

	cat $gshadowFileUsers >> $gshadowFile
