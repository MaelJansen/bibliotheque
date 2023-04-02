FROM ubuntu:latest

ARG DATABASE_URL

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

COPY . /app

RUN apt update && apt install -y git composer wget curl php-xml php-curl php-mysql

# install symfony
RUN wget https://get.symfony.com/cli/installer -O - | bash
RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

RUN symfony composer update && symfony composer install && echo "DATABASE_URL=${DATABASE_URL}" > .env.local
RUN sed -i 's/%env(CORS_ALLOW_ORIGIN)%/*/g' ./config/packages/nelmio_cors.yaml

EXPOSE 8000

CMD symfony server:start
