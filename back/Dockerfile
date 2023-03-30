FROM ubuntu:latest

ARG CLONE_URL
ARG DATABASE_URL

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

RUN apt update && apt install -y git composer wget curl php-xml php-curl php-mysql

RUN git clone ${CLONE_URL} sae4

# install symfony
RUN wget https://get.symfony.com/cli/installer -O - | bash
RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

RUN cd sae4/back && symfony composer update && symfony composer install && echo "DATABASE_URL=${DATABASE_URL}" > .env.local

EXPOSE 8000

CMD cd /app/sae4/back && symfony server:start
