FROM python:3.8-slim as base

RUN apt-get update && apt-get install -y build-essential git

ENV CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

ARG install_dev_dependencies=false

WORKDIR /app

COPY . /app

RUN mkdir -p /install && \
    pip install -e ./stac_fastapi/types && \
    pip install -e ./stac_fastapi/api && \
    pip install -e ./stac_fastapi/extensions && \
    pip install -e ./stac_fastapi/sqlalchemy[server] && \
    pip install -e ./stac_fastapi/pgstac[server]
