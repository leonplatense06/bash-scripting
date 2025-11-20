#!/bin/bash

mover_archivos () {
    if [ ! -d "$HOME/bin" ]; then
        mkdir "$HOME/bin"
        echo "Se creo el directorio $HOME/bin"
    fi

    cant_movidos=0

    for arc in *; do
        # cheque de literalidad, ¿¿¿ esta bien ???
        if [[ -f "$arc" && -x "$arc" ]]; then
            if mv "$arc" "$HOME/bin/"; then
                echo "$(basename $arc) movido."
                (( cant_movidos++ ))
            else
                echo "No pudo moverse el archivo $(basename $arc) al directorio $HOME/bin"
            fi
        fi
    done
    
    echo "Se han movido ${cant_movidos} archivos del directorio $PWD a $HOME/bin"
    return 0
}

mover_archivos