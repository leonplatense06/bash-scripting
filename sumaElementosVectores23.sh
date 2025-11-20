vector1=(10 5 87 12)
vector2=(6 81 17 91)

length () {
    if [ $# -ne 1 ]; then
        echo "Se espera un y solo un parametro."
        exit 1
    fi
    declare -n arr="$1"
    echo ${#arr[@]}
}

coincidenLength () {
    lenV1=$(length vector1)
    lenV2=$(length vector2)
    # si las longitudes NO coinciden, return 1 (error)
    if [ $lenV1 -ne $lenV2 ]; then
        return 1
    fi
    # si coinciden, return 0 (ok)
    return 0
}

sumarVectores () {
    if ! coincidenLength; then
        echo "Error: Los vectores NO tienen la misma longitud."
        exit 1
    fi
    contador=0
    for num in ${vector1[@]}; do
        echo "La suma de los elementos de la posicion ${contador} de los vectores es $(( num+vector2[${contador}] ))"
        (( contador++ ))
    done
}

sumarVectores