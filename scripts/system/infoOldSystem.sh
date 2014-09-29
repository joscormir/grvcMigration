#! /bin/bash 

#Se necesita saber cuales son los  servicios y runlevels que el servidor antiguo tiene, así que se van a pasar
#una serie de comandos que se ejecutarán en línea en este script y que se guardarán en mi carpeta para que yo
#analice.
echo "lista de servicios y su estado, copiando en systemList.txt..."

if ! service --status-all >> /home/joscormir/systemList.txt ; then 
	echo "service no existe y no se ha copiado"
fi

#-------------------------------------------------------------------------
echo  "Haciendo copia de los run level de cada servicio..."

if  ! chkconfig --list >> /home/joscormir/runLevelsList.txt ; then 
	echo "chkconfig no existe y no se ha copiado"
elif ! sysv-rc-conf --list >> /home/joscormir/runLevelsList.txt 
	echo "sysv-rc-conf tampoco existe "
fi

#-------------------------------------------------------------------------
echo "Haciendo copia de run level de nivel 2..."	

if ! ls -l /etc/rc2.d >> /home/joscormir/runLevels2List.txt ; then 
	echo "no se ha podido copiar run level 2"
fi

#-------------------------------------------------------------------------
#puede que haya algunas áreas que no estén configuradas a través del init del sistema
#por eso vamos a utilizar netstat
echo "Haciendo copia de la respuesta de netstat..."

if  ! netstat -nlp >> /home/joscormir/netStatList.txt ; then 
	echo "No se ha podido usar netstat"
fi  

#-------------------------------------------------------------------------
#información acerca de los puertos que utilizan los servicios
echo "haciendo copia de los puertos que utilizan los servicios activos..."
if  ! lsof -nPi >> /home/joscormir/portList.txt ; then
	echo "no se han podido copiar los puertos"
fi
#-------------------------------------------------------------------------
echo "haciendo copia de los puertos que utilizan los servicios activos..."
if  ! lsof -nPi >> /home/joscormir/portList.txt ; then
	echo "no se han podido copiar los puertos"
fi
#-------------------------------------------------------------------------
echo "haciendo copia de los puertos que utilizan los servicios activos y de que sockets..."
if  ! ss -nlpaxtudw >> /home/joscormir/portSocketList.txt ; then
	echo "no se han podido copiar los puertos porque no existe el comando"
fi

