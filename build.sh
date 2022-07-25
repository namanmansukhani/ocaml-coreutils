#!/bin/sh
mkdir -p bin
for FILE in src/*ml
do
    fname=${FILE%.*}
    ocamlopt $FILE -o bin/${fname##*/}
done
