FROM nginx:stable-alpine

COPY  ./nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /app

ADD . .

RUN yarn

RUN yarn run build

COPY /app/dist /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]