#! /bin/bash

#lo unico que hay que hacer para poder cambiar un usuario por otro especifico
#es utilizar el flag de chown llamado --from

newUsr=""
oldUsr=""
filePath=""

chown --from=oldUsr newUsr filePath  

#comprueba si todo está en orden 
ls -l

