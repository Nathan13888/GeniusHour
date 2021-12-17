#!/bin/bash

FILES="$(ls assets/gallery/**/*.JPG | sed '/^[[:space:]]*$/d')"
OBJECTS=()

for file in ${FILES[@]}; do
    #echo "$file"
    NAME=$(echo "$file" | cut -c 16- | tr -d ".JPG" )
    #echo $NAME
    obj="$(jo src=$file title=$NAME)"
    #echo $obj
    OBJECTS+=($obj)
done

CMD=""

for obj in ${OBJECTS[@]}; do
    CMD="$CMD $obj"
    #echo $obj
done

jo -p -a $CMD

