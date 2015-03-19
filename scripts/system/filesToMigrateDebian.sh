#! /bin/bash

#Define variables to use in the script

lastDate="2014-09-19"
actualDate="2015-03-17"

touch /home/joscormir/lastDate.file -d $lastDate
touch /home/joscormir/actualDate.file -d $actualDate

lastDateFilePath=/home/joscormir/lastDate.file
actualDateFilePath=/home/joscormir/actualDate.file 

dirToSave="/home/joscormir"

clear

echo "Extracting files that have changed in /home"
cd /home 
find . -type f -newer $lastDateFilePath ! -newer $actualDateFilePath >> $dirToSave/homeChanges.txt

echo "Extracting files that have changed in /disk"
cd /disk 
find . -type f -newer $lastDateFilePath ! -newer $actualDateFilePath >> $dirToSave/diskChanges.txt

echo "Extracting files that have changed in /var"
cd /var 
find . -type f -newer $lastDateFilePath ! -newer $actualDateFilePath >> $dirToSave/varChanges.txt

echo "Finished"
