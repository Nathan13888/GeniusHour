#!/bin/bash

FILES="$(ls assets/gallery/**/*.JPG | sed '/^[[:space:]]*$/d')"

for file in ${FILES[@]}; do
    echo "$file"
    SIZE=$(identify "$file"|cut -d " " -f3)
    #WIDTH=$(echo "$SIZE"|cut -d "x" -f1)
    #echo $WIDTH $HEIGHT
    #HEIGHT=$(echo "$SIZE"|cut -d "x" -f2)
    convert "$file" -crop 2448x2448+408+0 "$file.OUT"
    mv -v "$file.OUT" "$file"
done
