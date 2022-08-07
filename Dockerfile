FROM node:18.0-alpine
COPY ./node_packages .
COPY ./index.js .
COPY ./public .
COPY ./views .
CMD [ "node", "index.js" ]
