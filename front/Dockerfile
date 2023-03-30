FROM node

ARG CLONE_URL
ARG REACT_URL
ARG REACT_PORT

WORKDIR /app

RUN git clone ${CLONE_URL} sae4

RUN cd sae4/front && npm install

EXPOSE 3000

RUN cd /app/sae4/front && printf "REACT_APP_API_URL=${REACT_URL}\nREACT_APP_API_PORT=${REACT_PORT}\n" > .env

CMD cd /app/sae4/front && npm start
