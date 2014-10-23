#! /bin/bash 

#Para empezar necestamos ir al /etc/passwd y ver donde empiezan las cuentas
#normales de usuario en el sistema de Debian. Es sabido que normalmente, los usuarios del sistema
#tienen valores por defecto de ID entre 0 y 499 y los de usuario normal van desde el 500 al 60000.
#Una vez encontrado esto podemos coger el ID (que es el de la tercera columna) para poner límite a nuestro comando
#No se exportaran usuarios o grupos por debajo de este limite.
#Tambien excluimos la cuenta "nobody" que tiene como ID el numero "65534" (confirmar)

#Metemos en limit el valor que encontramos en /etc/passwd de Debian

let limit=115

#----------------usuarios ---------------------------------#

awk -v LIMIT=$limit -F: '($3>=LIMIT) && ($3!=65534)' /home/joscormir/programming/grvcMigration/scripts/users/passwd > /home/joscormir/programming/grvcMigration/scripts/users/passwd.old

#----------------grupos -----------------------------------#

awk -v LIMIT=$limit -F: '($3>=LIMIT) && ($3!=65534)' /home/joscormir/programming/grvcMigration/scripts/users/group > /home/joscormir/programming/grvcMigration/scripts/users/group.old

#Hacemos lo mismo para el fichero de shadow con las contraseñas encriptadas, usando el mismo límite:

#----------------passwords --------------------------------#

awk -v LIMIT=$limit -F: '($3>=LIMIT) && ($3!=35534) {print $1}' /home/joscormir/programming/grvcMigration/scripts/users/passwd | tee - | egrep -f - /home/joscormir/programming/grvcMigration/scripts/users/shadow > /home/joscormir/programming/grvcMigration/scripts/users/shadow.old

#----------------group passwords --------------------------#

awk -v LIMIT=$limit -F: '($3>=LIMIT) && ($3!=65534) {print $1}' /home/joscormir/programming/grvcMigration/scripts/users/group | tee - | egrep -f - /home/joscormir/programming/grvcMigration/scripts/users/gshadow > /home/joscormir/programming/grvcMigration/scripts/users/gshadow.old

#Ya tenemos todos los passwords copiados en nuestros ficheros en root ahora necesitamos comprobar que no hay conflictos 
#antes de realizar ninguna copia
#por tanto hay que seguir los pasos de la wiki.
 


