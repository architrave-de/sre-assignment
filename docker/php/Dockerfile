FROM php:7.2-fpm
RUN docker-php-ext-install mysqli
# Secret of $PHP_INI_DIR, lies here https://hub.docker.com/_/php/ (see example)
COPY opcache/99-architrave.ini $PHP_INI_DIR/conf.d/99-architrave.ini
