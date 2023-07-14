FROM node:alpine

WORKDIR /app

COPY package.json .

RUN apk --no-cache add make

RUN npm install

COPY . .

RUN npm install jest --save-dev

EXPOSE 3000

CMD [ "node", "index.js" ]
