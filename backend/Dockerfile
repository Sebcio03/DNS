FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9-slim

LABEL maintainer="Sebastian Ozimkowski <sebastianozimkowski@outlook.com>"

RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get install curl -y

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

COPY ./app/pyproject.toml ./app/poetry.lock* /app/

WORKDIR /app/
RUN poetry install --no-root --no-dev

COPY /app/ /app/
