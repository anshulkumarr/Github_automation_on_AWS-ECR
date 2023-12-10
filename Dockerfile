FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY helloworld.html /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/

EXPOSE 80
