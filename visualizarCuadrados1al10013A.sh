#!/bin/bash
# Realizar un script que visualice por pantalla los números del 1 al 100 así
# como sus cuadrados

num=1

for i in {1..100}
do
    echo "Numero: $i, cuadrado: $(( $i * $i ))"
done