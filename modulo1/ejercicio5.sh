#!/bin/bash

if [[ "$#" -gt 2 ]]; then
  echo "> Se necesitan únicamente dos parámetros para ejecutar este script"
  return 1
elif [[ "$#" -lt 2 ]]; then
  echo "> Se necesitan dos parámetros para ejecutar este script"
  return 1
fi
  
# recogemos los parametros de la palabra a buscar
url=$1
word=$2

# descarga del contenido de $url y se almacena en downloaded.txt
curl -ks $1 -o downloaded.txt

# Contamos cuantas ocurrencias de la palabra introducida existe en el archivo descargado
ocurrences=$(grep -i -n -o $word downloaded.txt | wc -l)

if [[ $ocurrences -eq 0 ]]; then
  echo "> No se ha encontrado la palabra $word"
else
  # Si la palabra aparece, buscamos la primera ocurrencia
  line=$(grep -i -m 1 -n -o $word downloaded.txt | awk -F ":" '{print $1}')
  echo "> La palabra \"$word\" aparece $ocurrences veces"
  echo "> Aparece por primera vez en la linea $line"
fi
