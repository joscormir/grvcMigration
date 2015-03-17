#! /bin/bash

#Define variables to use in the script

lastDate 	= "2014-09-19"
actualDate 	= "2015-03-17"

dirToSave = "/home/joscormir/Documentos/grvcMigration/scripts/system/"

clear
echo "Extracting files that have changed in /home"

cd /home 
find . type f -newermt $lastDate ! -newermt $actualDate >> $dirtoSave/homeChanges.txt

clear
echo "Extracting files that have changed in /disk"

cd /disk 
find . type f -newermt $lastDate ! -newermt $actualDate >> $dirtoSave/diskChanges.txt


clear
echo "Extracting files that have changed in /var"

cd /var 
find . type f -newermt $lastDate ! -newermt $actualDate >> $dirtoSave/varChanges.txt

echo "Finished"
