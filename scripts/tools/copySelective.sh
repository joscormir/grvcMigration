#!/bin/bash
clear

echo "Copying /home/..."
cd /mnt/migracion
mkdir selectiveCopy

#---------------------------------------------------------------------
echo "Copia de ragel"
cd /mnt/migracion
mkdir selectiveCopy/ragel 
cd /home/ragel
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/selectiveCopy/ragel

echo "copia de imaza"
cd /mnt/migracion
mkdir selectiveCopy/imaza 
cd /home/imaza
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/selectiveCopy/imaza

echo "copia de merino"
cd /mnt/migracion
mkdir selectiveCopy/merino 
cd /home/merino
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/selectiveCopy/merino

echo "copia de chur"
cd /mnt/migracion
mkdir selectiveCopy/chur 
cd /home/chur
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/selectiveCopy/chur

echo "copia de jorgemunoz"
cd /mnt/migracion
mkdir selectiveCopy/jorgemunoz 
cd /home/jorgemunoz
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/selectiveCopy/jorgemunoz

echo "copia de aerosens"
cd /mnt/migracion
mkdir selectiveCopy/aerosens 
cd /home/projects/aerosens
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/selectiveCopy/aerosens

echo "copia de alejandro"
cd /mnt/migracion
mkdir selectiveCopy/alejandro 
cd /home/alejandro
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/selectiveCopy/alejandro

