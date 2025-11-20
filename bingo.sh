#!/bin/bash

source ./implementacionSet30.sh

generar_numero () {
    if [ "$#" -ne 1 ]; then
        echo "Se espera un y solo un parametro en la funcion generar_numero"
        return 1
    fi
    lim_sup="$1"
    echo "$(( RANDOM % (lim_sup - 0 + 1) + 0 ))" # RANDOM % (lim_sup - lim_inf + 1) + lim_inf
    return 0
}

ronda () {
    if [[ "$#" -ne 1 || "$1" -le 0 || "$1" -gt 32767 ]]; then
        echo "Se espera un y solo un parametro en la funcion ronda, y el mismo debe estar entre 1 y 32767."
        return 1
    fi

    nuevo_num=$(generar_numero "$1")

    while ! add "$nuevo_num" > /dev/null; do
        nuevo_num=$(generar_numero "$1")
    done

    echo "SALIO EL NUMERO ${nuevo_num}."
    return 0
}

if [ "$#" -gt 1 ]; then
    echo "Se esperan uno o ningun parametro."
    exit 1
fi

bingo=1

# defino limite de numeros
if [ "$#" -eq 0 ]; then
    lim_sup=99
else
    lim_sup="$1"
fi

num_ronda=1

while [ $bingo -eq 1 ]; do
    echo " <--- RONDA ${num_ronda} ---> "
    ronda "$lim_sup"
    (( num_ronda++ ))
    op="n"
    read -p "¿ Cantar bingo ? [y/n]... " op
    if [[ "$op" = "y" || "$op" = "Y" ]]; then
        bingo=0
    fi
done

echo "¡¡¡ GANASTE !!!"
echo "Lista de numeros: "
print