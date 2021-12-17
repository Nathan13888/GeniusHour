#!/bin/bash

FILES="$(ls assets/carousel | sed '/^[[:space:]]*$/d')"
OBJECTS=()

for file in ${FILES[@]}; do
    #echo "$file"
    obj="$(jo src=/assets/carousel/$file link= title=)"
    #echo $obj
    OBJECTS+=($obj)
done

CMD=""

for obj in ${OBJECTS[@]}; do
    CMD="$CMD $obj"
    #echo $obj
done

jo -p -a $CMD

