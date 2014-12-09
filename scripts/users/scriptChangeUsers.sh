#! /bin/bash

#lo unico que hay que hacer para poder cambiar un usuario por otro especifico
#es utilizar el flag de chown llamado --from

newUsr=""
#en newUsr hay que poner root:root por ejemplo
oldUsr="" 
#en oldUsr hay que poner el nombre del usuario antiguo solo.
filePath=""

chown --from=oldUsr newUsr filePath  

#comprueba si todo está en orden 
ls -l

#La forma anterior SOLO es posible si el documento tiene el fichero con un usuario y no con una UID del dispositivo.

#Este es el comando que tenemos que utilizar para cambiarlo con la UID

find /var/www/old_web -uid 33 -exec chown apache:apache {} +

