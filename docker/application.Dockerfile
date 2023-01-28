FROM python:3.8.0

ARG POETRY_PYPI_TOKEN_PYPI

WORKDIR /application

COPY . /application

RUN apt-get update && apt-get install -y libpq-dev gcc curl

RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.2.0

ENV PATH="${PATH}:/root/.local/bin"
ENV POETRY_PYPI_TOKEN_PYPI=${POETRY_PYPI_TOKEN_PYPI}

RUN poetry config installer.max-workers 10

RUN poetry lock

RUN poetry install --no-interaction --no-ansi -vvv --no-root

RUN chmod +x scripts/poetry_deploy.sh

RUN scripts/poetry_deploy.sh

CMD ["sh", "scripts/start.sh"]