FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

RUN apt update && apt install -y git composer wget curl php-xml php-curl php-mysql

RUN git clone https://qmongeot:yJcxGh6dy5UPhtjsoiEZ@gitlab-ce.iut.u-bordeaux.fr/tfourcaudot/sae4.git

# install symfony
RUN wget https://get.symfony.com/cli/installer -O - | bash
RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

RUN cd sae4/back && symfony composer update && symfony composer install && echo "DATABASE_URL=mysql://prod:prod@185.212.225.123/prod?serverVersion=5.7" > .env.local

EXPOSE 8000

CMD cd /app/sae4/back && symfony server:start
