#! /bin/bash

#aquÃ­ es donde se desarrolla el script para convertir de un charset a otro. Por ejemplo de ISO88591 a UTF8

if [ $# -ne 3 ]; then
echo âusage: â$0â³ dest_directory original_encoding destination_encodingâ
exit
fi;

dir=$1
from=$2
to=$3

if [ ! -d $dir ]; then
mkdir $dir
fi

for f in $( ls . ); do
if [ -f $f ]; then
iconv -f $from -t $to $f > $dir$f
fi
done
