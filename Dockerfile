FROM node:18.7-alpine
COPY node_modules /node_modules
COPY index.js /index.js
COPY public /public
COPY views /views
CMD [ "node", "index.js" ]
