#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Cantidad de parametros erronea, se espera uno parametro"
    exit 1 # exit 1 => salio por un error
fi

while :; do # while true tambien funciona, es lo mismo
    if who | grep -q "$1\b"; then # -q hace que en lugar de imprimir algo, devuelva 0 si lo encuentra, 1 si no
        echo "Usuario ${1} logueado en el sistema"
        exit 0 # exit 0 => termino todo bien
    fi
    sleep 10
done