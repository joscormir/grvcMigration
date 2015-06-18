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

read -n1 -r -p "Presiona c para continuar o enter para saltar..." key
if [ "$key" = 'c' ]; then
	
	echo "Usuario juanvillanueva"
	cd /home
	mkdir juanvillanueva
	chown juanvillanueva:staff /home/juanvillanueva
	cd $mountHD/juanvillanueva
	find ./ -xdev -print0 | cpio -pa0V /home/juanvillanueva
	chown -R juanvillanueva:apache /home/juanvillanueva/public_html
	
	echo "Usuario perezh"
	cd /home
	mkdir perezh
	chown perezh:staff /home/perezh
	cd $mountHD/perezh
	find ./ -xdev -print0 | cpio -pa0V /home/perezh
	chown -R perezh:apache /home/perezh/public_html
	
	echo "Usuario alejandro"
	cd /home
	mkdir alejandro
	chown alejandro:staff /home/alejandro
	cd $mountHD/alejandro
	find ./ -xdev -print0 | cpio -pa0V /home/alejandro
	chown -R alejandro:apache /home/alejandro/public_html
	
	echo "Usuario alejandro_grvc"
	cd /home
	mkdir alejandro_grvc
	chown alejandro_grvc:staff /home/alejandro_grvc
	cd $mountHD/alejandro_grvc
	find ./ -xdev -print0 | cpio -pa0V /home/alejandro_grvc
	chown -R alejandro_grvc:apache /home/alejandro_grvc/public_html
	
	#Ahora vamos a migrar los repositorios por lo que vamos a tener que utilizar el 
	#fichero de comparación para ver que cambió desde la última vez a ahora. 
	
	#Una vez ejecutado empezamos a hacer la migración
else
	echo "has saltado el bloque de incluir usuarios"
fi

#----------------------------------------------------------------------------------------
echo "Incluimos los nuevos SVN a disk"
	
read -n1 -r -p "Presiona c para continuar o enter para saltar..." key
if [ "$key" = 'c' ]; then
	echo"Incluimos svn-teresa"	
	cd /disk
	mkdir svn-teresa
	chown apache:svnteresa /disk/svn-teresa
	cd $mountHD/disk/svn-teresa
	find ./ -xdev -print0 | cpio -pa0V /disk/svn-teresa
	echo"Incluimos svn-teresa-docs"
	cd /disk
	mkdir svn-teresa-docs
	chown apache:svnteresa /disk/svn-teresa-docs
	cd $mountHD/disk/svn-teresa-docs
	find ./ -xdev -print0 | cpio -pa0V /disk/svn-teresa-docs
	#cambio de usuarios
	#No olvidar incluir los anteriores en la configuración del SVN
else
	echo "has saltado el bloque de nuevos SVN"
fi

#----------------------------------------------------------------------------------------
echo "Cambios en SVN"

read -n1 -r -p "Presiona c para continuar o enter para saltar..." key
if [ "$key" = 'c' ]; then
	rm -rf /disk/svn-planning/*
	cd $mountHD/disk/svn-planning 
	find ./ -xdev -print0 | cpio -pa0V /disk/svn-planning
	
	rm -rf /disk/svn-doc/*
	cd $mountHD/disk/svn-doc 
	find ./ -xdev -print0 | cpio -pa0V /disk/svn-doc
	
	rm -rf /disk/svn-upc/*
	cd $mountHD/disk/svn-upc 
	find ./ -xdev -print0 | cpio -pa0V /disk/svn-upc
	#cambio de usuarios
else
	echo "has saltado el bloque de cambios en SVN"
fi

#----------------------------------------------------------------------------------------
echo "cambios en CVS"

read -n1 -r -p "Presiona c para continuar o enter para saltar..." key
if [ "$key" = 'c' ]; then
	rm -rf /var/cvs/*
	cd $mountHD/var/cvs
	find ./ -xdev -print0 | cpio -pa0V /var/cvs
	
	rm -rf /var/cvs-doc/*
	cd $mountHD/var/cvs-doc
	find ./ -xdev -print0 | cpio -pa0V /var/cvs-doc
	
	rm -rf /var/cvs-frog/*
	cd $mountHD/var/cvs-frog
	find ./ -xdev -print0 | cpio -pa0V /var/cvs-frog
	
	rm -rf /var/cvs-laser/*
	cd $mountHD/var/cvs-laser
	find ./ -xdev -print0 | cpio -pa0V /var/cvs-laser
	#cambio de usuarios si fuera necesario (no debería a que los usuarios ya están migrados)
else
	echo "has saltado el bloque de cambios de CVS"
fi	

#----------------------------------------------------------------------------------------
echo "cambios en /var"

read -n1 -r -p "Presiona c para continuar o enter para saltar..." key
if [ "$key" = 'c' ]; then
	echo "cambios en /var"
	rm -rf /var/www/reports/*
	cd $mountHD/var/www/reports
	find ./ -xdev -print0 | cpio -pa0V /var/www/reports
	
	rm -rf /var/www/old_web/publica/*
	cd $mountHD/var/www/publica
	find ./ -xdev -print0 | cpio -pa0V /var/www/old_web/publica
	
	#Estos son elementos independientes, por lo que vamos a copiarlos y cambiar a quien pertenecen
else 
	echo "has saltado el bloque de cambios en var/"
fi

#----------------------------------------------------------------------------------------
echo "Cambios en la web (antigua)"

read -n1 -r -p "Presiona c para continuar o enter para saltar..." key
if [ "$key" = 'c' ]; then
	rm /var/www/old_web/componentes.php
	cp $mountHD/var/www/componentes.php /var/www/old_web/componentes.php
	chown apache:apache /var/www/old_web/componentes.php
	
	rm /var/www/old_web/en/componentes.php
	cp $mountHD/var/www/en/componentes.php /var/www/old_web/en/componentes.php
	chown apache:apache /var/www/old_web/en/componentes.php
	
	rm /var/www/old_web/en/principal.php
	cp $mountHD/var/www/en/principal.php /var/www/old_web/en/principal.php
	chown apache:apache /var/www/old_web/en/principal.php
	
	rm /var/www/old_web/principal.php
	cp $mountHD/var/www/principal.php /var/www/old_web/principal.php
	chown apache:apache /var/www/old_web/principal.php
	
	rm /var/www/old_web/en/PhDpositions_GRVC_USE.pdf
	cp $mountHD/var/www/en/PhDpositions_GRVC_USE.pdf /var/www/old_web/en/PhDpositions_GRVC_USE.pdf
	chown apache:apache /var/www/old_web/en/PhDpositions_GRVC_USE.pdf
else
	echo "has saltado el bloque de cambios en la web (antigua)"
fi
#----------------------------------------------------------------------------------------
echo "Carpetas de Home"

read -n1 -r -p "Presiona c para continuar o enter para saltar..." key
if [ "$key" = 'c' ]; then
	rm -rf  /home/imaza/public_html/*
	cd $mountHD/imaza/public_html
	find ./ -xdev -print0 | cpio -pa0V /home/imaza/public_html
	chown -R imaza:apache /home/imaza/public_html
	
	rm -rf  /home/aollero/public_html/*
	cd $mountHD/aollero/public_html
	find ./ -xdev -print0 | cpio -pa0V /home/aollero/public_html
	chown -R aollero:apache /home/aollero/public_html
	
	cp $mountHD/caba/videoFROG_November.mp4 /home/caba/videoFROG_November.mp4
	chown caba:research /home/caba/videoFROG_November.mp4
	
	cp $mountHD/ftp/ferruz/Bender2.exe /home/ftp/ferruz/Bender2.exe
	chown ferruz:research /home/ftp/ferruz/Bender2.exe
	
	cp $mountHD/ftp_staff/chur/Librerias_c++/CGAL/CGAL-latest.zip /home/ftp_staff/chur/Librerias_c++/CGAL/CGAL-latest.zip
	chown chur:staff /home/ftp_staff/chur/Librerias_c++/CGAL/CGAL-latest.zip
	
	rm -rf  /home/projects/aerosens/public_html/*
	cd $mountHD/projects/aerosens/public_html
	find ./ -xdev -print0 | cpio -pa0V /home/projects/aerosens/public_html
	chown -R aerosens:apache /home/projects/aerosens/public_html
	
	rm -rf  /home/ferruz/public_html/*
	cd $mountHD/ferruz/public_html
	find ./ -xdev -print0 | cpio -pa0V /home/ferruz/public_html
	chown -R ferruz:apache /home/ferruz/public_html
	
	rm -rf  /home/jperezlara/public_html/*
	cd $mountHD/jperezlara/public_html
	find ./ -xdev -print0 | cpio -pa0V /home/jperezlara/public_html
	chown -R jperezlara:apache /home/jperezlara/public_html
	
	rm -rf  /home/chorro/public_html/*
	cd $mountHD/chorro/public_html
	find ./ -xdev -print0 | cpio -pa0V /home/chorro/public_html
	chown -R chorro:apache /home/chorro/public_html
	
	rm -rf  /home/felramfab/public_html/*
	cd $mountHD/felramfab/public_html
	find ./ -xdev -print0 | cpio -pa0V /home/felramfab/public_html
	chown -R felramfab:apache /home/felramfab/public_html
	
	rm -rf  /home/jorgemunoz/public_html/*
	cd $mountHD/jorgemunoz/public_html
	find ./ -xdev -print0 | cpio -pa0V /home/jorgemunoz/public_html
	chown -R jorgemunoz:apache /home/jorgemunoz/public_html
	
	#Hay cambios en los últimos cuatro usuarios pero al ser de nueva creación pues
	#con la copia completa los cambios se consideran hechos
else
	echo "has saltado el bloque de carpetas en home"
fi
#----------------------------------------------------------------------------------------
echo "Fin del script"







