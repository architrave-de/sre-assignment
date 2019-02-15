FROM php:7.2-fpm
RUN docker-php-ext-install mysqli
COPY conf_files/php_overrides.ini          /usr/local/etc/php/conf.d/
COPY conf_files/php.ini                    $PHP_INI_DIR/php.ini
#We can also use $PHP_INI_DIR/conf.d/


