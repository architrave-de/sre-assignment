# Download base image nginx
FROM nginx

MAINTAINER Tejas Gadaria

# Install Openssl
RUN RUN apt-get update && apt-get install -y openssl

# Create directory to store configurartion
RUN mkdir /etc/nginx/sites-enabled
RUN mkdir /etc/nginx/sites-available
RUN mkdir /etc/ssl/certs
RUN mkdir /etc/ssl/private

# Remove unnecessary files
RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/nginx.conf

# Upload nginx configuration
COPY config/nginx.conf                               /etc/nginx/
COPY config/vhost/architrave-vhost-ssl.conf          /etc/nginx/sites-available/
COPY config/vhost/architrave-vhost.conf              /etc/nginx/sites-available/
COPY config/custom_logs/nginx-custom-logs.conf       /etc/nginx/conf.d/

# Upload SSL Certificate
COPY cert/architrave.key    /etc/ssl/private/
COPY cert/architrave.crt    /etc/ssl/certs/

# Create softlink
RUN ln -s /etc/nginx/sites-available/architrave-vhost.conf      /etc/nginx/sites-enabled/architrave-vhost.conf
RUN ln -s /etc/nginx/sites-available/architrave-vhost-ssl.conf  /etc/nginx/sites-enabled/architrave-vhost-ssl.conf

# Create PEM file
RUN cd /etc/nginx/ && openssl dhparam -dsaparam -out dhparams.pem 2048

# Allow container to expose port 80 and 443
EXPOSE 80 443

# Start nginx Service
CMD ["service", "nginx", "restart"]
