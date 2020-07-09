FROM nginx:latest

WORKDIR /app

COPY . /app/

RUN ls 

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

RUN cat /etc/nginx/conf.d/default.conf

RUN nginx

EXPOSE 80
