#!/bin/bash

printf "\n[Info]: Iniciando o build e o deploy com poetry\n"

printf "\n[Info]: Configurando o token de autenticação do PyPI\n"
poetry config pypi-token.pypi "${POETRY_PYPI_TOKEN_PYPI}"

printf "\n[Info]: Iniciando o build da aplicação\n"
poetry build

printf "\n[Info]: Iniciando a publicação do pacote no PyPI\n"
poetry publish --skip-existing

printf "\n[Info]: Deploy finalizado com sucesso!\n"
