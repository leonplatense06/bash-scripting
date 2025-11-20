#!/bin/bash

renombrar () {
    if [ $# -ne 3 ]; then
        echo "Cantidad erronea de parametros"
        exit 1
    fi
    if [ ! -d "$1" ]; then
        echo "Deber ingresarse un directorio como primer parametro"
        exit 1
    fi
    if [ "$2" = "-a" ]; then
        for arc in "$1"/*; do
            mv "$arc" "${arc}${3}"
        done
    elif [ "$2" = "-b" ]; then
        for arc in "$1"/*; do
            nuevoNombre="${3}$(basename "$arc")"
            mv "$arc" "$1/${nuevoNombre}"
        done
    fi
}

if [ "$#" -ne 3 ]; then
    echo "Se esperan 3 parametros."
    exit 1
fi

renombrar "$1" "$2" "$3"