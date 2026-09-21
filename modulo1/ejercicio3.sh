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
