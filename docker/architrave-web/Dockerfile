FROM nginx:latest

RUN apt-get update
RUN apt-get install -y openssl php7.0-fpm php7.0-cli php7.0-mysql php7.0-curl php7.0-intl php7.0-mcrypt php7.0-sqlite3 php7.0-imagick php7.0-apcu php-apcu-bc php7.0-xml php7.0-bcmath php7.0-mbstring php7.0-zip php7.0-soap

RUN /usr/bin/openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
