#! /bin/bash

#En primer lugar detectar cual es el uid del usuario que hay que borrar y se realizará mediante 2 pasos. En primer lugar se obtendrá el uid del usuario y se borrará su home y todo lo que haya dentro de él. En segundo lugar se buscarán todos los archivos que puedan pertenecer a ese uid y se preguntará si se quieren borrar o no.

#primero compruebo que soy root para poder realizar todas las operaciones descritas.

if whoami=="root"; then
 echo "Nice, you can deal with this"
else
 echo "please need to be root to do this"; exit 1
fi

#Comienza el script

echo -n "Please enter de user you want to delete: "
read userName

#Extraemos el uid y borramos el usuario y su home.
userUID=$(id -u $userName 2>/dev/null)

if [[ $userUID == "" ]]; then
	echo "This user does not exist"
	exit 1
else
	echo "Your uid is" $userUID
fi

echo -n "We are going to proceed to delete user $userName and /home/$userName. Are you sure?[Y/N]"
read answer

if [[ $answer == "Y" ]] || [[ $answer == "y" ]]; then
 sudo userdel -r $userName
 echo "$userName and his directory deleted"
elif [[ $answer == "N" ]] || [[ $answer == "n" ]]; then
 echo "Maybe next time"
else 
 echo "Launch again and type right please"
fi

#Ahora procedemos a buscar todos los archivos y preguntamos si los queremos borrar

echo "Files still left to remove, you can review that in /temp/filestoremove$userName.txt"

find / -uid $userUID 2>/dev/null -fprint /tmp/filestoremove$userName.txt

echo "Do you want to delete them?[Y/N]"
read answerLeft

if [[ $answerLeft == "Y" ]] || [[ $answerLeft == "y" ]]; then
 find / -uid $userUID 2>/dev/null -exec rm -rf {} \; 
 echo "All files related to $userName has been deleted"
elif [[ $answerLeft == "N" ]] || [[ $answerLeft == "n" ]]; then
 echo "Maybe next time"
else 
 echo "Launch again and type right please"
fi

#Borramos el fichero para que no queden huellas

rm -rf /tmp/filestoremove$userName.txt 



