#!/bin/sh

# ADDUSER - add a new user to the system, including building their
#           home directory, copying in default config data, etc.
#           For a standard Unix/Linux system, not Mac OS X

pwfile="/etc/passwd"	shadowfile="/etc/shadow"
gfile="/etc/group"
hdir="/home"
fdir="/home/ftp_ugv"
htmldir="public_html"
webgroup="www-data"
shell="/bin/bash"

if [ "$(whoami)" != "root" ] ; then
  echo "Error: You must be root to run this command." >&2
  exit 1
fi

echo "Add new user account to $(hostname)"
echo -n "login: "     ; read login

# adjust '5000' to match the top end of your user account namespace
# because some system accounts have uid's like 65535 and similar.

uid="$(awk -F: '{ if (big < $3 && $3 < 5000) big=$3 } END { print big + 1 }' $pwfile)"
homedir=$hdir/$login
ftpdir=$fdir/$login

# asking for the user group
echo -n "group: "     ; read group
while [ "$(cut -f1 -d: $gfile | grep $group)" != $group ]
do
	echo "Error: $group group does not exist." >&2
	cut -f1 -d: $gfile
	echo -n "Choose group: "     ; read group
done
gid="$(grep $group $gfile | cut -f3 -d: )"

echo -n "full name: " ; read fullname
#echo -n "shell: "     ; read shell

echo "Setting up account $login for $fullname..."

echo ${login}:x:${uid}:${gid}:${fullname}:${homedir}:$shell >> $pwfile
echo ${login}:*:11647:0:99999:7::: >> $shadowfile
usermod -G$group $login
#echo "${group}:x:${gid}:$login" >> $gfile

mkdir $homedir
mkdir $ftpdir
cp -R /etc/skel/.[a-zA-Z]* $homedir
cp -R /etc/skel/$htmldir $homedir

chmod 750 $ftpdir
chown -R $login.$group $ftpdir
chmod 711 $homedir
chmod 750 $homedir/$htmldir
chmod g+s $homedir/$htmldir
chown -R $login.$group $homedir
chown -R $login.$webgroup $homedir/$htmldir

#find $homedir -print | xargs chown ${login}:$login 

# setting an initial password
passwd $login

exit 0
