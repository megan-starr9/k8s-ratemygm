FROM node:12 as builder

WORKDIR /src
COPY package*.json ./
RUN npm install
COPY tsconfig*.json ./
COPY ./src .
RUN npm run build

FROM node:12 as serve

WORKDIR /src
COPY --from=builder /src/package*.json ./
COPY --from=builder /src/node_modules ./node_modules
COPY --from=builder /src/dist/* ./
CMD [ "node", "server.js" ]
