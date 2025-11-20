# Realice un script que agregue en un arreglo todos los nombres de los usuarios
# del sistema pertenecientes al grupo “users”. Adicionalmente el script puede
# recibir como parámetro:
# ➢ “-b n”: Retorna el elemento de la posición n del arreglo si el mismo
# existe. Caso contrario, un mensaje de error.
# ➢ “-l”: Devuelve la longitud del arreglo
# ➢ “-i”: Imprime todos los elementos del arreglo en pantalla

# salida de getent group users es algo asi: users:x:100:usuario1,usuario2,usuario3,root
# le paso la salida a cut y le digo que el delimiter el ":",
# y que me quiero quedar con el 4to campo, la lista de usuarios del grupo
users_string=$(getent group users | cut -d ":" -f 4)
users_arr=($(echo "$users_string" | tr "," " "))

imprimirArray () {
    for elem in "${users_arr[@]}"; do
        echo "$elem"
    done
}

existePos () {
    # ¿¿¿¿ chequeo la cantidad de parametros aunque sea yo mismo quien la llama ????
    if [ "$#" -ne 1 ]; then
        echo "Se espera un y solo un parametro en la funcion existePos."
        exit 1
    fi
    if [[ "$1" -ge 0 && "$1" -lt "${#users_arr[@]}" ]]; then
        return 0 # el indice esta ok
    fi
    return 1 # error en el indice
}

# <-- bloque principal -->

if [[ "$#" -ne 1 && "$#" -ne 2 ]]; then
    echo "Se esperan uno o dos parametros <-- -b n, -l, -i -->"
    exit 1
fi

case "$1" in
    "-b")
        if [ "$#" -ne 2 ]; then
            echo "Se esperan dos parametros."
            exit 1
        fi
        if ! existePos "$2"; then
            echo "La posicion ingresada no es parte del arreglo."
            exit 1
        fi
        echo "${users_arr[${2}]}"
        ;;
    "-l")
        echo ${#users_arr[@]}
        ;;
    "-i")
        imprimirArray
        ;;
    *)
        echo "Parametro invalido, opciones <-- -b n, -l, -i -->"
        exit 1
        ;;
esac
