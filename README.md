# lemoncode
Entregas del campus lemoncode 

# MODULO 1
Entrega de los ejercicios del módulo 1

## Ejercicio 1
```
[root@ol10 ~]# mkdir -p /foo/dummy /foo/empty
[root@ol10 ~]# echo 'Me encanta la bash !!' > /foo/dummy/file1.txt
[root@ol10 ~]# touch /foo/dummy/file2.txt
[root@ol10 ~]# tree -a /foo
/foo
├── dummy
│   ├── file1.txt
│   └── file2.txt
└── empty

3 directories, 2 files
[root@ol10 ~]# cat /foo/dummy/file1.txt
Me encanta la bash !!
[root@ol10 ~]# touch /foo/dummy/file2.txt
[root@ol10 ~]# cat /foo/dummy/file2.txt
[root@ol10 ~]#
```

## Ejercicio 2
```
[root@ol10 ~]# cat /foo/dummy/file1.txt > /foo/dummy/file2.txt
[root@ol10 ~]# mv /foo/dummy/file2.txt /foo/empty
[root@ol10 ~]# tree /foo
/foo
├── dummy
│   └── file1.txt
└── empty
    └── file2.txt

3 directories, 2 files
[root@ol10 ~]# cat /foo/dummy/file1.txt
Me encanta la bash !!
[root@ol10 ~]# cat /foo/empty/file2.txt
Me encanta la bash !!
[root@ol10 ~]#
```

## Ejercicio 3
Para generar el script he utilizado el comando 'vi ejercicio3.sh'. El contenido del script es:
```
[root@ol10 ~]# cat ejercicio3.sh
#!/bin/bash

read -p "Enter text: " param
if [[ -z $param ]]; then
  text="Que me gusta la bash!!!!"
else
  text=$param
fi

echo "Comandos Ejercicio 1:"
echo "mkdir -p /foo/dummy /foo/empty"
mkdir -p /foo/dummy /foo/empty
echo "echo \$text > /foo/dummy/file1.txt"
echo $text > /foo/dummy/file1.txt
echo "touch /foo/dummy/file2.txt"
touch /foo/dummy/file2.txt
echo "Result:"
tree -a /foo
echo "Contents of /foo/dummy/file1.txt:"
cat /foo/dummy/file1.txt
echo "Contents of /foo/dummy/file2.txt:"
cat /foo/dummy/file2.txt

echo "Comandos Ejercicio 2:"
echo "cat /foo/dummy/file1.txt > /foo/dummy/file2.txt"
cat /foo/dummy/file1.txt > /foo/dummy/file2.txt
echo "mv /foo/dummy/file2.txt /foo/empty"
mv /foo/dummy/file2.txt /foo/empty
echo "Result:"
tree /foo
echo "Contents of /foo/dummy/file1.txt:"
cat /foo/dummy/file1.txt
echo "Contents of /foo/empty/file2.txt:"
cat /foo/empty/file2.txt
```

### Ejecución script:
```
[root@ol10 ~]# . ./ejercicio3.sh
Enter text: This is the text for exercise 3
Comandos Ejercicio 1:
mkdir -p /foo/dummy /foo/empty
echo $text > /foo/dummy/file1.txt
touch /foo/dummy/file2.txt
Result:
/foo
├── dummy
│   ├── file1.txt
│   └── file2.txt
└── empty

3 directories, 2 files
Contents of /foo/dummy/file1.txt:
This is the text for exercise 3
Contents of /foo/dummy/file2.txt:
Comandos Ejercicio 2:
cat /foo/dummy/file1.txt > /foo/dummy/file2.txt
mv /foo/dummy/file2.txt /foo/empty
Result:
/foo
├── dummy
│   └── file1.txt
└── empty
    └── file2.txt

3 directories, 2 files
Contents of /foo/dummy/file1.txt:
This is the text for exercise 3
Contents of /foo/empty/file2.txt:
This is the text for exercise 3
```

## Ejercicio 4
El contenido del script es:
```
[root@ol10 ~]# cat ejercicio4.sh
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
```

### Ejecución script:
```
[root@ol10 ~]# . ./ejercicio4.sh patata
> No se ha encontrado la palabra patata
[root@ol10 ~]#
[root@ol10 ~]# . ./ejercicio4.sh translation
> La palabra "translation" aparece 6 veces
> Aparece por primera vez en la linea 81
[root@ol10 ~]#
```

## Ejercicio 5
El contenido del script es:
```
[root@ol10 ~]# cat ejercicio5.sh
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
```

### Ejecución script:
```
[root@ol10 ~]# . ./ejercicio5.sh https://www.lipsum.com patata 27
> Se necesitan únicamente dos parámetros para ejecutar este script
[root@ol10 ~]# . ./ejercicio5.sh https://www.lipsum.com
> Se necesitan dos parámetros para ejecutar este script
[root@ol10 ~]# . ./ejercicio5.sh https://www.lipsum.com translation
> La palabra "translation" aparece 6 veces
> Aparece por primera vez en la linea 81
[root@ol10 ~]#
```