FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM node:alpine

WORKDIR '/app'

COPY server.js .

RUN npm install express

COPY --from=0 /app/build .

CMD ["node", "server.js"]