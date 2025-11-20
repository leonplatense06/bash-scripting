if [ $# -ne 1 ]; then
    echo "Cantidad de parametros erronea, se espera uno y solo uno"
    exit 1
fi

rutaUsr="$USERPROFILE"

cant=$(find "${rutaUsr}" -type f -name "*.${1}" | wc -l)
    # find busca en la ruta que le demos, -type f indica que solo me quedo con lo que sean archivos
    # -name le digo como se tiene que llamar el archiv, en este caso seria loquesea.extencion-que-mande-por-parametro
    # | (pipe) le pasa la salida de ese comando a wc, que con el paramtro -l cuenta lineas (find devuelve una linea por cada
    # archivo), wc cuenta y devuelve la cantidad de lineas (archivos encontrados).

nombreUsr="$(basename "$rutaUsr")"

echo "${nombreUsr}, ${cant}" > "reporte.txt"
    # con > reemplazamos todo lo que haya en el archivo reporte.txt por el texto nuevo que pongamos,
    # en cambio con >> le hacemos un append, agregando una nueva linea con el texto que pongamos.
    # Si el archivo no existe, lo crean.
echo "Informacion guardada en reporte.txt"
   
