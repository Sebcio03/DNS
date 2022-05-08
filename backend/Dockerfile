FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8-slim

LABEL maintainer="Sebastian Ozimkowski sebastianozimkowski@outlook.com>"

RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get install curl -y

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

WORKDIR /app/
COPY pyproject.toml poetry.lock* /app/
RUN poetry install --no-root --no-dev

EXPOSE 80
COPY ./app/ /app/