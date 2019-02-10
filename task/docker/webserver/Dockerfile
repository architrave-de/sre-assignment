FROM nginx

RUN apt-get update && apt-get install -y openssl
COPY conf_files/architrave-vhost.j2        /etc/nginx/sites-available/architrave-vhost.conf
COPY conf_files/architrave-vhost-ssl.j2    /etc/nginx/sites-available/architrave-vhost-ssl.conf
COPY conf_files/nginx-custom-logs.conf.j2  /etc/nginx/conf.d/nginx-custom-logs.conf
RUN mkdir /etc/nginx/sites-enabled
RUN cd /etc/nginx/sites-enabled
RUN ln -s /etc/nginx/sites-available/architrave-vhost.conf    /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/architrave-vhost-ssl.conf   /etc/nginx/sites-enabled/
RUN rm /etc/nginx/conf.d/default.conf

COPY conf_files/cert.j2               /etc/ssl/certs/architrave.crt
COPY conf_files/key.j2                /etc/ssl/private/architrave.key

RUN rm /etc/nginx/nginx.conf
COPY conf_files/nginx.conf             /etc/nginx/

RUN cd /etc/nginx/ && openssl dhparam -dsaparam -out dhparams.pem 2048

RUN echo "/etc/init.d/nginx start" >> /etc/rc.local
RUN chmod 755 /etc/rc.local
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
