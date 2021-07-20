#!/bin/bash
> dependencies.txt
while read libfile; do
    libname="$(apt-file search $libfile | awk -F':' '{ if (NR==1) print $1; }')"
    echo $libname provides $libfile
    echo $libname >> dependencies.txt
done < depend_libs.txt
