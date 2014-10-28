#!/bin/sh

hdir="/home"
fdir="/home/ftp_pfc"
htmldir="public_html"
webgroup="www-data"
shell="/bin/bash"

if [ "$(whoami)" != "root" ] ; then
  echo "Error: You must be root to run this command." >&2
  exit 1
fi

echo "Change user permissions in $(hostname)"
echo -n "login: "     ; read login
group="pfc"

homedir=$hdir/$login
ftpdir=$fdir/$login

chmod -R 700 $homedir
chmod 711 $homedir
chown -R $login.$group $homedir
chown -R $login.$webgroup $homedir/$htmldir

chmod -R 740 $homedir/$htmldir
chmod g+s $homedir/$htmldir
cd $homedir/$htmldir
HOMEWEB_DIR_LIST=` find -type d -print `

N=1
DIR=` echo "$HOMEWEB_DIR_LIST" | tail +$N | head -n1 `

while test ! "$DIR" = ""
	do
		chmod g+x "$DIR"
		N=`expr $N + 1`
		DIR=` echo "$HOMEWEB_DIR_LIST" | tail +$N | head -n1 `
	done

chown -R $login.$group $ftpdir

chmod -R 740 $ftpdir
chmod 750 $ftpdir
cd $ftpdir
HOMEFTP_DIR_LIST=` find -type d -print `

N=1
DIR=` echo "$HOMEFTP_DIR_LIST" | tail +$N | head -n1 `

while test ! "$DIR" = ""
	do
		chmod g+x "$DIR"
		N=`expr $N + 1`
		DIR=` echo "$HOMEFTP_DIR_LIST" | tail +$N | head -n1 `
	done

exit 0
