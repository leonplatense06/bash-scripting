#!/bin/bash

initialize () {
    set=()
}

contains () {
    if [ "$#" -ne 1 ]; then
        echo "Se espera un y solo un parametro en la funcion contains."
        return 1
    fi
    for elem in "${set[@]}"; do
        if [ "${elem}" = "$1" ]; then
            return 0
        fi
    done
    return 1
}

initialize_with () {
    if [ "$#" -eq 0 ]; then
        echo "Se espera al menos un parametro en la funcion initialize_with."
        return 1
    fi
    initialize
    for arg in "$@"; do
        add "$arg"
    done
}

add () {
    if [ "$#" -ne 1 ]; then
        echo "Se espera un y solo un parametro en la funcion add."
        return 1
    fi
    if ! contains "$1"; then
        set+=( "$1" )
        return 0
    fi
    echo "El elemento ya se encuentra en el conjunto."
    return 1
}

remove () {
    if [ "$#" -eq 0 ]; then
        echo "Se espera al menos un parametro en la funcion remove."
        return 1
    fi

    # guardo los parametros en un array y la longitud del conjunto antes de intentar borrar
    local elems_borrar=("$@")
    local long_before="${#set[@]}"

    for (( i=0; i < "${long_before}"; i++ )); do
        # si el elemento del conjunto esta en el arreglo de parametros -> lo borro
        if [[ "${elems_borrar[@]}" =~ "${set[$i]}" ]]; then
            unset set[$i]
        fi
    done
    # si la longitud bajo, al menos una de las eliminaciones funciono
    if [ "$long_before" -lt "${#set[@]}" ]; then
        set=( "${set[@]}" )
        return 0
    fi
    return 1
}

print () {
    for elem in "${set[@]}"; do
        echo "${elem}"
    done
    return 0
}

print_sorted () {
    print | sort
    return 0
}

# <--------------------------->

# initialize_with "Ramon" "AAAAAPepe" "ZZZZZLucas" "CCCMaria"

# add "ZZJorge"
# add "Javier Toledo"
# add "AAndres"
# add "Roberto"

# print
# echo " <-----> "
# print_sorted

# echo " <-------------------------------------------------------------------------->"

# remove "Ramon" "Javier Toledo" "Roberto" "AA" # el "AA" es para verificar que no borre a AAndres ni a AAAAAPepe

# print
# echo " <-----> "
# print_sorted

# funciona