#!/bin/bash

printf "\n[Info]: Executando a documentação\n"

printf "\n[Info]: Instalando o doxygen\n"

cd doxygen-1.9.6

make install

cd ../

printf "\n[Info]: Criando o arquivo de configuração do doxygen\n"
doxygen -g Doxyfile

printf "\n[Info]: Executando o doxygen\n"
doxygen Doxyfile

printf "\n[Info]: Executando o build com o sphinx\n"
sphinx-build -b html source docs

printf "\n[Info]: Gerando os arquivos html e latex\n"
make html

cd build/html

http-server -s

printf "\n[Info]: Documentação finalizada com sucesso!\n"