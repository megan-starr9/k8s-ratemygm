FROM node:12 as builder

COPY package*.json ./
RUN npm install
COPY tsconfig*.json ./
COPY ./src .
RUN npm run build

FROM node:12 as serve

WORKDIR /src
COPY --from=builder package*.json ./
COPY --from=builder /node_modules ./node_modules
COPY --from=builder /dist .
CMD [ "node", "server.js" ]
