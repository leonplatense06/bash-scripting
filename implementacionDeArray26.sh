#!/bin/bash


inicializar () {
    array=()
}

agregar_elem () {
    if [ "$#" -ne 1 ]; then
        echo "Se espera un y solo un parametro."
        return 1
    fi
    array+=( "$1" )
}

eliminar_elem () {
    if [ "$#" -ne 1 ]; then
        echo "Se espera un y solo un parametro."
        return 1
    fi
    if [[ "$1" -lt 0 || "$1" -ge "${#array[@]}" ]]; then
        echo "Posicion invalida."
        return 1
    fi
    unset "array[${1}]"
    array=( "${array[@]}" )        
}

longitud () {
    echo "${#array[@]}"
}

imprimir () {
    for elem in "${array[@]}"; do
        echo "${elem}"
    done
}

inicializar_con_valores() {
    if [ "$#" -ne 2 ]; then
        echo "Se esperan 2 y solo 2 parametros en la funcion incializar_con_valores: longitud y valor."
        return 1
    fi

    array=()

    local len="$1"
    local valor="$2"
    for (( i=0; i<len; i++ )); do
        array+=( "${valor}" )
    done
}
