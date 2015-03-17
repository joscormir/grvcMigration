#
#! /bin/bash
clear
echo "copying apache files"

cd etc/httpd 
find ./ -xdev -print0 | cpio -pa0V /home/joscormir/penDrive/httpd

echo "copying php files"

cd etc/php.d

find ./ -xdev -print0 | cpio -pa0V /home/joscormir/penDrive/php.d

#here we copy just the php.ini file
echo "copying php.ini"

cd /etc

cp php.ini /home/joscormir/penDrive

echo "copying mysql files"

cd /etc	
echo "copying my.conf"

cp my.cnf /home/joscormir/penDrive

cd /var/lib/mysql

find ./ -xdev -print0 | cpio -pa0V /home/joscormir/penDrive/mysql

echo "finished"




