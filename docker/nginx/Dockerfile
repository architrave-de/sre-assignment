FROM nginx

RUN apt-get update && apt-get install -y openssl

RUN rm /etc/nginx/conf.d/default.conf

COPY config/architrave-vhost.conf /etc/nginx/conf.d/architrave-vhost.conf

COPY config/architrave-vhost-ssl.template /etc/nginx/conf.d/architrave-vhost-ssl.template

COPY config/nginx-custom-logs.conf /etc/nginx/conf.d/nginx-custom-logs.conf

COPY certs/architrave.crt /etc/ssl/certs/architrave.crt

COPY certs/architrave.key /etc/ssl/private/architrave.key

COPY config/nginx.conf /etc/nginx/nginx.conf
# https://www.openssl.org/docs/man1.1.1/man1/dhparam.html#OPTIONS see -dsaparam
RUN cd /etc/nginx/ && openssl dhparam -dsaparam -out dhparams.pem 2048
