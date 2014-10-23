#! /bin/bash 

#En este script se va a copiar los datos de los usuarios previa comprobación  de que no hay conflicto.

#awk '{print $3}' /home/joscormir/programming/grvcMigration/scripts/users/new_server/passwd.old | grep -vf - /home/joscormir/programming/grvcMigration/scripts/users/new_server/passwd

awk -F'|' 'NR==FNR{c[$3]++;next};c[$3] > 0' /home/joscormir/programming/grvcMigration/scripts/users/new_server/passwd /home/joscormir/programming/grvcMigration/scripts/users/new_server/passwd.old
#awk 'FNR == NR {a[$3]; next} $3 in a'  /home/joscormir/programming/grvcMigration/scripts/users/new_server/passwd.old /home/joscormir/programming/grvcMigration/scripts/users/new_server/passwd
 
#Si no existe conflicto podemos pasar a realizar copia de los usuarios.

#----------------usuarios ---------------------------------#

#/root/passwd.old > /etc/passwd

#----------------grupos -----------------------------------#

#/root/group.old > /etc/group

#Hacemos lo mismo para el fichero de shadow con las contraseñas encriptadas, usando el mismo límite:

#----------------passwords --------------------------------#

#/root/shadow.old > /etc/shadow

#----------------group passwords --------------------------#

#/root/gshadow.old > /etc/gshadow

