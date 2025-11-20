num=(10 3 5 7 9 3 5 4)

productoria () {
    local res=1
    for elem in "${num[@]}"; do
        res=$(( res*elem ))
    done
    echo "${res}"
}

productoria