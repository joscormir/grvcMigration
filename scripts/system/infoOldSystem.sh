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
elif ! sysv-rc-conf --list >> /home/joscormir/runLevelsList.txt ; then 
	echo "sysv-rc-conf tampoco existe "
fi

#-------------------------------------------------------------------------
echo "Haciendo copia de run level de nivel 2..."	

if ! ls -l /etc/rc2.d >> /home/joscormir/runLevels2List.txt ; then 
	echo "no se ha podido copiar run level 2 porque no existe el comando"
fi

#-------------------------------------------------------------------------
#Esta parte suelen tenerla solo los servidores de Ubuntu pero es posible que algunas
#versiones de Debian lo incluyan, por si acaso se encuentran aquí para que se ejecuten si
#es que el comando existiese.
echo "respuesta de Upstart si el sistema lo tiene instalado..."	

if ! initctl list >> /home/joscormir/upStartList.txt ; then 
	echo "no se ha podido copiar upStartList porque no existe el comando"
fi
echo "Configuración de upStart..."	

if ! initctl show-config >> /home/joscormir/upStartConfigList.txt ; then 
	echo "no se ha podido copiar la configuracion upStartList porque no existe el comando"
fi

 if cp ls -l  /etc/init >> /home/joscormir/initDebian.txt ; then
	echo "se ha copiado el init del sistema" 
else 
	echo "no se ha podido copiar el init"
fi
# si tenemos un sistema en Debian que adopte un systema de inicializacion del tipo
#systemd init ejecutamos lo siguiente
if ! systemctl list-units -t service >> /home/joscormir/systemctlServiceList.txt ; then 
	echo "no se ha podido copiar la lista de servicios en ctl porque no existe el comando"
fi

if ! systemctl list-units -t target >> /home/joscormir/systemctlTargetList.txt ; then 
	echo "no se ha podido copiar la lista de targets en ctl porque no existe el comando"
fi

if ! systemctl list-unit-files -t service >> /home/joscormir/systemctlAvailableTargetsList.txt ; then 
	echo "no se ha podido copiar la lista de targets disponibles en ctl porque no existe el comando"
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

