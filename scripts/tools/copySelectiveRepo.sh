#!/bin/bash
clear

echo "Copying SVN repositories..."
cd /mnt/migracion
mkdir svnCopy

#---------------------------------------------------------------------
echo "Copia de svn-planning"
cd /mnt/migracion
mkdir svnCopy/svn-planning 
cd /disk/svn-planning
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/svnCopy/svn-planning 

#---------------------------------------------------------------------
echo "Copia de svn-teresa"
cd /mnt/migracion
mkdir svnCopy/svn-teresa 
cd /disk/svn-teresa
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/svnCopy/svn-teresa

#---------------------------------------------------------------------
echo "Copia de svn-teresa-docs"
cd /mnt/migracion
mkdir svnCopy/svn-teresa-docs
cd /disk/svn-teresa-docs
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/svnCopy/svn-teresa-docs

#---------------------------------------------------------------------
echo "Copia de svn-adam"
cd /mnt/migracion
mkdir svnCopy/svn-adam
cd /disk/svn-adam
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/svnCopy/svn-adam

#---------------------------------------------------------------------
echo "Copia de svn-doc"
cd /mnt/migracion
mkdir svnCopy/svn-doc
cd /disk/svn-doc
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/svnCopy/svn-doc


#---------------------------------------------------------------------
echo "Copia de svn-DEM"
cd /mnt/migracion
mkdir svnCopy/svn-DEM
cd /disk/svn-DEM
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/svnCopy/svn-DEM

#---------------------------------------------------------------------
echo "Copia de svn-safemobil"
cd /mnt/migracion
mkdir svnCopy/svn-safemobil
cd /disk/svn-safemobil
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/svnCopy/svn-safemobil

#---------------------------------------------------------------------
echo "Copia de svn-upc"
cd /mnt/migracion
mkdir svnCopy/svn-upc
cd /disk/svn-upc
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/svnCopy/svn-upc

#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------

echo "Copying CVS repositories..."
cd /mnt/migracion
mkdir cvsCopy

#---------------------------------------------------------------------
echo "Copia de cvs"
cd /mnt/migracion
mkdir cvsCopy/cvs 
cd /var/cvs
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/cvsCopy/cvs

#---------------------------------------------------------------------
echo "Copia de cvs-doc"
cd /mnt/migracion
mkdir cvsCopy/cvs-doc
cd /var/cvs-doc
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/cvsCopy/cvs-doc


#---------------------------------------------------------------------
echo "Copia de cvs-frog"
cd /mnt/migracion
mkdir cvsCopy/cvs-frog 
cd /var/cvs-frog
find ./ -xdev -print0 | cpio -pa0V /mnt/migracion/cvsCopy/cvs-frog
