FROM nginx:latest

RUN rm /etc/nginx/conf.d/default.conf

COPY index.html /usr/share/nginx/html

COPY nginx/default.conf /etc/nginx/conf.d/default.conf