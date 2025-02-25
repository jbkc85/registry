FROM python:3.9.6-slim-buster

RUN mkdir /registry && \
    apt-get update && \
    apt-get install -y curl linux-headers-amd64 gcc && \
    rm -rf /var/lib/apt/lists/*

RUN pip install poetry

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g ganache-cli

WORKDIR /registry
COPY /dockerfs/shell-entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
