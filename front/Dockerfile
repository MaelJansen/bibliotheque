FROM node

ARG CLONE_URL
ARG REACT_URL
ARG REACT_PORT

WORKDIR /app

RUN git clone ${CLONE_URL} sae4

RUN apt update && apt install nginx -y

RUN cd sae4/front && npm install && printf "REACT_APP_API_URL=${REACT_URL}\nREACT_APP_API_PORT=${REACT_PORT}\n" > .env && npm run build

RUN cp -r /app/sae4/front/build/* /var/www/html/

EXPOSE 80

CMD nginx -g "daemon off;"