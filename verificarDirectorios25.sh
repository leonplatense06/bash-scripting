#!/bin/bash

indicarArcDir () {
    if [ "$#" -ne 1 ]; then
        echo "Se espera un y solo un parametro en la funcion indicarArcDir."
        exit 1
    fi
    if [ -d "$1" ]; then
        echo "${1} es un directorio."
    else
        echo "${1} es un archivo."
    fi
}

recorrerArray () {
    if [ "$#" -ne 1 ]; then
        echo "Se espera un y solo un parametro en la funcion recorrerArray."
        exit 1
    fi
    declare -n arr="$1"
    local i=0
    local cantNoExist=0
    while [ $i -lt ${#arr[@]} ]; do
        if [ -e "${arr[i]}" ]; then
            indicarArcDir "${arr[i]}"
            echo " <-- ------------ --> "
        else
            (( cantNoExist++ ))
        fi
        (( i += 2 ))
    done
    echo "${cantNoExist} de los paths recibidos no existe/n."
}

# verifico al menos un parametro
if [ "$#" -lt 1 ]; then
    echo "Se espera al menos un parametro."
    exit 1
fi
args=("$@")

echo " <-- ------------ --> "
recorrerArray args