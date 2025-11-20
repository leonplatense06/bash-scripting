#!/bin/bash

array=()

verArchivo () {
    if [ "$#" -ne 1 ]; then
        echo "Se espera un y solo un parametro."
        return 1
    fi

    local nom="$1"

    for arc in "${array[@]}"; do
        if [ "$nom" = "$arc" ]; then
            cat "$arc"
            return 0
        fi
    done
    echo "Archivo ${nom} no encontrado."
    return 5
}

cantidadArchivos () {
    # echo "${#array[@]}"
    # return 0
    echo "$(find /home -type f -name "*.doc" | wc -l)"
    return 0
}

eliminar_logicamente () {
    if [ "$#" -ne 1 ]; then
        echo "Se espera un y solo un paremetro y el mismo debe ser un archivo."
        return 1
    fi

    nuevo=()
    # para borrar de un array por contenido, creo uno nuevo con todos los que no sean el elemento a eliminar
    for arc in "${array[@]}"; do
        if [ "$arc" != "$1" ]; then
            nuevo+=( "$arc" )
        fi
    done

    # sobreescribo el verdadero array por el nuevo sin el elemento eliminado
    array=( "${nuevo[@]}" )
    return 0
}

eliminar_fisicamente () {
    # aca no chequeo que lo recibido sea un archivo xq si no esta en el file system pero si en el array me va a crear problemas con el
    # borrarArchivo, ya que no se va a eliminar del vector y va a dar error, cuando en realidad es una opcion totalmente valida
    if [ "$#" -ne 1 ]; then
        echo "Se espera un y solo un parametro en la funcion eliminar_fisicamente y el mismo debe ser un archivo."
        return 1
    fi
    # uso -f y si el archivo no esta en el file system -> no pasa nada
    rm -f "${1}"
    return 0
}

borrarArchivo () {
    if [ "$#" -ne 1 ]; then
        echo "Se espera un y solo un parametro en la funcion borrarArchivo."
        return 1
    fi
    # verifico existencia del archivo y el cat lo mando al /dev/null xq no quiero que se muestre
    if ! verArchivo "$1" > /dev/null; then
        echo "Archivo no encontrado."
        return 10
    fi
    read -p "Desea eliminar el archivo logicamente? [y/n]: " op
    case "$op" in
        "y")
            if eliminar_logicamente "$1"; then
                echo "Archivo borrado logicamente."
                return 0
            fi
            return 1
            ;;
        "n")
            if eliminar_logicamente "$1" && eliminar_fisicamente "$1"; then
                echo "Archivo borrado fisicamente."
                return 0
            fi
            return 1
            ;;
        *)
            echo "Opcion invalida."
            return 1
            ;;
    esac
}



for arc in /home/*.doc; do
    if [ -f "$arc" ]; then
        array+=( "$arc" )
    fi
done