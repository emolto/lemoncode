#!/bin/bash

# recogemos el parametro de la palabra a buscar
word=$1

# descarga pagina principal de www.lipsum.com y almacenada en loremIosum.html
curl -ks https://www.lipsum.com -o loremIpsum.html

# Contamos cuantas ocurrencias de la palabra introducida existe en el archivo descargado
ocurrences=$(grep -i -n -o $word loremIpsum.html | wc -l)

if [[ $ocurrences -eq 0 ]]; then
  echo "> No se ha encontrado la palabra $word"
else
  # Si la palabra aparece, buscamos la primera ocurrencia
  line=$(grep -i -m 1 -n -o $word loremIpsum.html | awk -F ":" '{print $1}')
  echo "> La palabra \"$word\" aparece $ocurrences veces"
  echo "> Aparece por primera vez en la linea $line"
fi
