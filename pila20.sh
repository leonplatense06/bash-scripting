stack=()

push () {
    if [ $# -ne 1 ]; then
        echo "Cantidad de parametros erronea, se espera 1 parametro"
        exit 1
    fi
    stack+=("$1")
}

pop () {
    if [ ${#stack[@]} -eq 0 ]; then
        exit 1
    fi
    id=$(( ${#stack[@]}-1 ))

    elem="${stack[$id]}"

    unset stack[$id]

    echo "$elem"
}

length () {
    echo ${#stack[@]}
}

print () {
    for elem in "${stack[@]}"; do
        echo "$elem"
    done
}

push 3
push 37
push perro
push hola
push 16

print
echo "<-- borrando item -->"
pop

echo "<-- volviendo a imprimir -->"
print
echo "<-- longitud -->"
length
# anda bien