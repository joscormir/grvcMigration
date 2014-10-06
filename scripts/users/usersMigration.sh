#! /bin/bash 

#En este script se va a copiar los datos de los usuarios previa comprobación  de que no hay conflicto.
let limit = 

awk -v LIMIT=$limit -F: '($3>=LIMIT) && ($3!=65534)'  /root/passwd.old #/etc/passwd
 


