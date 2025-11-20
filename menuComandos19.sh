#!/bin/bash

showMenu () {
    echo "MENU DE COMANDOS"
    counter=1
    for arc in ./*.sh; do
        if [ "$arc" != "$0" ]; then
            scripts+=("$arc") # guardo cada script en un array
            echo " ${counter}. $(basename ${arc})"
            (( counter++ ))
        fi
    done
}

requestExe () {
    read -p "Ingrese su eleccion: " op
    scriptElegido=${scripts[$(( op-1 ))]} # me quedo con el script en la posicion elegida -1 xq arranca en 0

    read -p "Ingrese los parametros deseados: " params

    bash "$scriptElegido" $params
}

scripts=()
showMenu
requestExe