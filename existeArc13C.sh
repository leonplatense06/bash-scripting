# Crear un script que reciba como parámetro el nombre de un archivo e
# informe si el mismo existe o no, y en caso afirmativo indique si es un
# directorio o un archivo. En caso de que no exista el archivo/directorio cree
# un directorio con el nombre recibido como parámetro.
verificar () {
    if [ $# -ne 1 ]; then # chequear cantidad de parametros
        echo "Cantidad de parametros erronea, debe ser 1 (uno)."
        exit 1
    fi
    nombre="$1"
    if [ -e "$nombre" ]; then # -e pregunta si el archivo existe
        if [ -d "$nombre" ]; then # -d pregunta si es un directorio
            echo "${nombre} es un directorio."
        elif [ -f "$nombre" ]; then # -f pregunta si es un file (archivo)
            echo "${nombre} es un archivo."
        else 
            echo "${nombre} no es directorio ni archivo."
        fi
    else
        echo "${nombre} no existe. Creando..."
        mkdir "${nombre}" # entre comillas porque sino crea un dir hola, y otro chau
        echo "Directorio ${nombre} creado con exito."
    fi
}

echo "$resultado"

if [ "$#" -ne 1 ]; then
    echo "Se espera un y solo un parametro."
    exit 1
fi

verificar "$1"