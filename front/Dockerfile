FROM node

WORKDIR /app

RUN git clone https://qmongeot:yJcxGh6dy5UPhtjsoiEZ@gitlab-ce.iut.u-bordeaux.fr/tfourcaudot/sae4.git

RUN cd sae4/front && npm install

EXPOSE 3000

CMD cd /app/sae4/front && npm start

