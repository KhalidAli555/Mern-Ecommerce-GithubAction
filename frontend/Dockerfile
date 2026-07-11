FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
# React embeds REACT_APP_* values at build time.  Pass this value from CI using
# Docker Buildx's `build-args` (for example, the REACT_APP_BASE_URL repository
# variable) rather than expecting a Kubernetes runtime environment variable.
ARG REACT_APP_BASE_URL
ENV REACT_APP_BASE_URL=${REACT_APP_BASE_URL}
RUN npm run build

FROM nginx:1.27-alpine

COPY --from=build /app/build /usr/share/nginx/html

RUN printf 'server {\n    listen 80;\n    server_name _;\n\n    root /usr/share/nginx/html;\n    index index.html;\n\n    location / {\n        try_files $uri $uri/ /index.html;\n    }\n}\n' > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
