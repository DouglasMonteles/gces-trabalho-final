#!/bin/bash

printf "\n[Info]: Executando a documentação\n"

printf "\n[Info]: Instalando o doxygen\n"

cd doxygen-1.9.6

make install

doxygen --version

printf "\n[Info]: Criando o arquivo de configuração do doxygen\n"
doxygen -g Doxyfile

printf "\n[Info]: Executando o doxygen\n"
doxygen Doxyfile

printf "\n[Info]: Documentação finalizada com sucesso!\n"