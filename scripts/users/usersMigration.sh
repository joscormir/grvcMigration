#! /bin/bash 

#En este script se va a copiar los datos de los usuarios previa comprobación  de que no hay conflicto.

awk -v -F: 'FNR == NR {a[$3]; next} $3 in a'  /root/passwd.old /etc/passwd
 
#Si no existe conflicto podemos pasar a realizar copia de los usuarios.

let limit = 

#----------------usuarios ---------------------------------#

/root/passwd.old > /etc/passwd

#----------------grupos -----------------------------------#

/root/group.old > /etc/group

#Hacemos lo mismo para el fichero de shadow con las contraseñas encriptadas, usando el mismo límite:

#----------------passwords --------------------------------#

/root/shadow.old > /etc/shadow

#----------------group passwords --------------------------#

/root/gshadow.old > /etc/gshadow

