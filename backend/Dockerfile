FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY controllers database middleware models routes seed utils ./
COPY index.js ./

EXPOSE 8000

CMD ["npm", "start"]
