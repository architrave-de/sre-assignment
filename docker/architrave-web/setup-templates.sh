mkdir /etc/ssl/private/
mkdir ${WEB_USER_PATH}
mkdir -p /run/php/
chown -R www-data.www-data /run/php
php-fpm7.0
sed 's/^user.*/user www-data;/' -i /etc/nginx/nginx.conf
rm /etc/nginx/conf.d/default.conf
envsubst '${HTTPD_SSL_CERT_PATH} ${HTTPD_SSL_KEY_PATH} ${FQDN} ${HTTPD_SENDFILE} ${WEB_USER_PATH} ${HTTPD_TRY_FILES} ${HTTPD_INDEX} ${HTTPD_CLIENT_MAX_BODY_SIZE} ' < /tmp/templates/architrave-vhost-ssl.template > /etc/nginx/conf.d/architrave-vhost-ssl.conf
#envsubst < /tmp/templates/architrave.template > /etc/ssl/certs/architrave.crt
#envsubst < /tmp/templates/architrave.template > /etc/ssl/private/architrave.key
envsubst '${DB_HOST} ${DB_USER} ${DB_PASSWORD} ${DB_NAME}' < /tmp/templates/index.php.template > ${WEB_USER_PATH}/index.php
#rm -rf /tmp/templates/
