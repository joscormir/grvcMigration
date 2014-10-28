#!/bin/bash
clear
echo "Copying / ..."
find / -xdev -print0 | cpio -pa0V /mnt/migracion
echo "Copying /home ..."
cd /home
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion
echo "Copying /home/projects ..."
cd /home/projects
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion
echo "Copying /home/ftp/anonymous ..."
cd /home/ftp/anonymous
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion
echo "Finished"




