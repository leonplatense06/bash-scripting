#!/bin/bash

mostarContar () {
    if [ $# -ne 1 ]; then
        echo "Se debe ingresar un y solo parametro."
        exit 1
    fi
    local cantImp=0
    declare -n arr="$1"
    for elem in "${arr[@]}"; do
        if [ $(( elem%2 )) -eq 0 ]; then
            echo "$elem"
        else
            (( cantImp++ ))
        fi
    done
    echo "Se contabilizaron ${cantImp} impares."
}

nums=(10 3 55 42 68 1)

mostarContar nums