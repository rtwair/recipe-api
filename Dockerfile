FROM python:3.7-alpine
MAINTAINER Riyad Twair

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
RUN pip install --no-cache-dir \
    flake8 \
    flake8-blind-except \
    flake8-builtins \
    flake8-colors \
    flake8-comprehensions \
    flake8-docstrings \
    flake8-import-order \
    flake8-mutable \
    flake8-pep3101 \
    flake8-pyi \
    flake8-quotes \
    flake8-string-format \
    pep8-naming
USER user