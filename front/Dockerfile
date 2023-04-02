FROM node:latest

ARG BACK_URL
ARG BACK_PORT

WORKDIR /app

COPY . /app

RUN apt update && apt install nginx -y

RUN npm install
RUN printf "REACT_APP_API_URL=http://${BACK_URL}\nREACT_APP_API_PORT=${BACK_PORT}\n" > .env && npm run build

RUN cp -r ./build/* /var/www/html/

EXPOSE 80

CMD nginx -g "daemon off;"
