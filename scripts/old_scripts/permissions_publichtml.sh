#!/bin/sh

hdir="/home"
htmldir="public_html"
webgroup="www-data"
shell="/bin/bash"

if [ "$(whoami)" != "root" ] ; then
  echo "Error: You must be root to run this command." >&2
  exit 1
fi

echo "Change public_html permissions in $(hostname)"
echo -n "login: "     ; read login

homedir=$hdir/$login

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

exit 0
