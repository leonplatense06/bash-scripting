# Crear un script que muestre 3 opciones al usuario: Listar, DondeEstoy y
# QuienEsta. Según la opción elegida se le debe mostrar:
# - Listar: lista el contenido del directorio actual.
# - DondeEstoy: muestra la ruta deldirectorio donde me encuentro ubicado.
# - QuienEsta: muestra los usuarios conectados al sistema.

menu () {
    op=0
    while [ "$op" != "1" ] && [ "$op" != "2" ] && [ "$op" != "3" ];
    do
        read -p "Seleccione una opcion: 1- Listar -- 2- DondeEstoy -- 3- QuienEsta:: " op
    done
    echo $op
    return
}

mostrar () {
    case $1 in
    "1")
        echo $(ls)
    ;;
    "2")
        echo $(pwd)
    ;;
    "3")
        echo $(who)
    esac
}

op=$(menu)
mostrar $op
