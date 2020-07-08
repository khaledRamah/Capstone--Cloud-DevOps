FROM nginx:latest

COPY index.html /usr/share/nginx/html

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

RUN sudo systemctl restart nginx

EXPOSE 80
