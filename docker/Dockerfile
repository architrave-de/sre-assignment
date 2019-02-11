FROM nginx:latest
MAINTAINER Juan Camacho - architrave

##Arguments
ARG nginx_location=/etc/nginx
ARG httpd_ssl_cert=/etc/ssl/
ARG php_location=/etc/php
ARG php_www=/var/www
ARG architraveport=8080
ARG mysql_location=/etc/mysql

EXPOSE ${architraveport}

##Install all the need packages
#PHP
RUN apt-get install php7.0-fpm php7.0-cli php7.0-mysql php7.0-curl php7.0-intl php7.0-mcrypt php7.0-sqlite3 php7.0-imagick php7.0-apcu php7.0-apcu-bc php7.0-xml php7.0-bcmath php7.0-mbstring php7.0-zip php7.0-soap -y

#MYSQL
RUN apt-get install mysql-community-server python-mysqldb

#COpy data from the server to the docker
#NGINX
COPY ${nginx_location} ${nginx_location}
COPY ${httpd_ssl_cert} ${httpd_ssl_cert}
#PHP
COPY ${php_location} ${php_location}
COPY ${php_www} ${php_www}
#MYSQL
COPY ${mysql_location}/my.cnf ${mysql_location}/my.cnf
COPY /root/.my.cnf /root/.my.cnf
COPY ${mysql_location}/conf.d/assignment.cnf ${mysql_location}/conf.d/assignment.cnf

##Run recycle of the services
RUN service nginx restart
RUN service php restart
RUN service mysql restart

#Start mysql configuration via sh script
ADD mysql_init.sh /tmp/init_db.sh
RUN /tmp/init_db.sh


#Start Clockwork at the container starts
CMD ["nginx", "-g", "daemon off;"]
