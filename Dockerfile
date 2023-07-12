FROM node:alpine

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

RUN npm install jest --save-dev

EXPOSE 3000

CMD [ "node", "index.js" ]
