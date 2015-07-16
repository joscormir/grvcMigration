#!/bin/bash
clear
#Primero tomamos los archivos de usuarios y contraseñas que son shadow, gshadow
# passwd y group e incluimos los usuarios nuevos con sus contraseñas y sus grupos 
# en los archivos de CentOS.

#Una vez incluidos copiamos sus carpetas del disco duro. Primero hay que montarlo,
#y donde se monte se le da la ubicacion a la variable
#Variables globales

mountHD="/media/backup" #Es un ejemplo
#----------------------------------------------------------------------------------------
echo "Copiando las carpetas de los usuarios nuevos"

read -n1 -r -p "Presiona c para continuar o enter para saltar... " key
if [ "$key" = 'c' ]; then
	
	echo "Usuario ejemplo"
	cd /home
	mkdir ragel
	chown ragel:staff /home/ragel
	cd $mountHD/selectiveCopy/ragel
	find ./ -xdev -print0 | cpio -pa0V /home/ragel
	chown -R ragel:apache /home/ragel/public_html
	
	#Ahora vamos a migrar los repositorios por lo que vamos a tener que utilizar el 
	#fichero de comparación para ver que cambió desde la última vez a ahora. 
	
	#Una vez ejecutado empezamos a hacer la migración
else
	echo "has saltado el bloque de incluir usuarios"
fi

#----------------------------------------------------------------------------------------
#echo"Incluimos los nuevos SVN a disk"
#	
#read -n1 -r -p "Presiona espacio para continuar o enter para saltar..." key
#if [ "$key" = ' ' ]; then
#
#	echo"Incluimos svn-nuevo"	
#	cd /disk
#	mkdir svn-nuevo
#	chmod o+x svn-nuevo
#	cd $mountHD/disk/svn-nuevo
#	find ./ -xdev -print0 | cpio -pa0V /disk/svn-nuevo
#	chown -R apache:svnnuevo /disk/svn-nuevo
#	
#else
#	echo "has saltado el bloque de nuevos SVN"
#fi

#----------------------------------------------------------------------------------------
echo "Cambios en SVN"

read -n1 -r -p "Presiona c para continuar o enter para saltar... " key
if [ "$key" = 'c' ]; then
	
	echo "Copia de svn-planning"
	rm -rf /disk/svn-planning/*
	cd $mountHD/svnCopy/svn-planning 
	find ./ -xdev -print0 | cpio -pa0V /disk/svn-planning
	chown -R apache:svnplanning /disk/svn-planning

	echo "Copia de svn-teresa"
	rm -rf /disk/svn-teresa/*
	cd $mountHD/svnCopy/svn-teresa 
	find ./ -xdev -print0 | cpio -pa0V /disk/svn-teresa
	chown -R apache:svnteresa /disk/svn-teresa

	echo "Copia de svn-teresa-docs"
	rm -rf /disk/svn-teresa-docs/*
	cd $mountHD/svnCopy/svn-teresa-docs
	find ./ -xdev -print0 | cpio -pa0V /disk/svn-teresa-docs
	chown -R apache:svnteresa /disk/svn-teresa-docs

	echo "Copia de svn-adam"
	rm -rf /disk/svn-adam/*
	cd $mountHD/svnCopy/svn-adam
	find ./ -xdev -print0 | cpio -pa0V /disk/svn-adam
	chown -R apache:sxha /disk/svn-adam
	
	echo "Copia de svn-DEM"
	rm -rf /disk/svn-DEM/*
	cd $mountHD/svnCopy/svn-DEM
	find ./ -xdev -print0 | cpio -pa0V /disk/svn-DEM
	chown -R apache:svnDEM /disk/svn-DEM

	echo "Copia de svn-doc"
	rm -rf /disk/svn-doc/*
	cd $mountHD/svnCopy/svn-doc
	find ./ -xdev -print0 | cpio -pa0V /disk/svn-doc
	chown -R apache:svnuser /disk/svn-doc
	
	echo "Copia de svn-safemobil"
	rm -rf /disk/svn-safemobil/*
	cd $mountHD/svnCopy/svn-safemobil
	find ./ -xdev -print0 | cpio -pa0V /disk/svn-safemobil
	chown -R apache:svnsafe /disk/svn-safemobil
	
	
	echo "Copia de svn-upc"
	rm -rf /disk/svn-upc/*
	cd $mountHD/svnCopy/svn-upc
	find ./ -xdev -print0 | cpio -pa0V /disk/svn-upc
	chown -R apache:svnupc /disk/svn-upc
	#Comprobar que todos están como los que no se han cambiado

else
	echo "has saltado el bloque de cambios en SVN"
fi
#----------------------------------------------------------------------------------------
echo "cambios en CVS"

read -n1 -r -p "Presiona c para continuar o enter para saltar... " key
if [ "$key" = 'c' ]; then

	echo "Copia de cvs" 
	rm -rf /var/cvs/*
	cd $mountHD/cvsCopy/cvs
	find ./ -xdev -print0 | cpio -pa0V /var/cvs
	
	echo "Copia de cvs-doc"
	rm -rf /var/cvs-doc/*
	cd $mountHD/cvsCopy/cvs-doc
	find ./ -xdev -print0 | cpio -pa0V /var/cvs-doc
	
	echo "copia de cvs-frog"
	rm -rf /var/cvs-frog/*
	cd $mountHD/cvsCopy/cvs-frog
	find ./ -xdev -print0 | cpio -pa0V /var/cvs-frog

	#Revisar CVSROOT
else
	echo "has saltado el bloque de cambios de CVS"
fi	

#----------------------------------------------------------------------------------------
echo "cambios en /var"

read -n1 -r -p "Presiona c para continuar o enter para saltar... " key
if [ "$key" = 'c' ]; then
	echo "cambios en /var/www/reports"
	rm -rf /var/www/reports/*
	cd $mountHD/var/www/reports
	find ./ -xdev -print0 | cpio -pa0V /var/www/reports
	chown -R apache:apache /var/www/reports

	#Estos son elementos independientes, por lo que vamos a copiarlos y cambiar a quien pertenecen
	echo "Copia de un documento que ha cambiado"
	cp $mountHD/var/www/publica/congresosint/documentos/Sandino_ICUAS_Denver2015.pdf /var/www/old_web/publica/congresosint/documentos/
	chown apache:apache /var/www/old_web/publica/congresosint/documentos/Sandino_ICUAS_Denver2015.pdf
	
else 
	echo "has saltado el bloque de cambios en var/"
fi

#----------------------------------------------------------------------------------------
echo "Carpetas de Home"

read -n1 -r -p "Presiona c para continuar o enter para saltar... " key
if [ "$key" = 'c' ]; then
	
	echo "Actualizando public_html de imaza"
	rm -rf  /home/imaza/public_html/*
	cd $mountHD/selectiveCopy/imaza/public_html
	find ./ -xdev -print0 | cpio -pa0V /home/imaza/public_html
	chown -R imaza:apache /home/imaza/public_html
	
	echo "Actualizando public_html de merino"
	rm -rf  /home/merino/public_html/*
	cd $mountHD/selectiveCopy/merino/public_html
	find ./ -xdev -print0 | cpio -pa0V /home/merino/public_html
	chown -R merino:apache /home/merino/public_html

	echo "Actualizando home de chur"
	rm -rf  /home/chur/*
	cd $mountHD/selectiveCopy/chur/
	find ./ -xdev -print0 | cpio -pa0V /home/chur
	chown -R chur:staff /home/chur
	
	echo "Actualizando public_html de jorgemunoz"
	rm -rf  /home/jorgemunoz/public_html/*
	cd $mountHD/selectiveCopy/jorgemunoz/public_html
	find ./ -xdev -print0 | cpio -pa0V /home/jorgemunoz/public_html
	chown -R jorgemunoz:apache /home/jorgemunoz/public_html
	
	echo "Actualizando public_html de aerosens"
	rm -rf  /home/projects/aerosens/public_html/*
	cd $mountHD/selectiveCopy/aerosens/public_html
	find ./ -xdev -print0 | cpio -pa0V /home/projects/aerosens/public_html
	chown -R aerosens:apache /home/projects/aerosens/public_html

	echo "Actualizando public_html de alejandro"
	rm -rf  /home/alejandro/public_html/*
	cd $mountHD/selectiveCopy/alejandro/public_html
	find ./ -xdev -print0 | cpio -pa0V /home/alejandro/public_html
	chown -R alejandro:apache /home/alejandro/public_html

else
	echo "has saltado el bloque de carpetas en home"
fi
#----------------------------------------------------------------------------------------
echo "Fin del script"







