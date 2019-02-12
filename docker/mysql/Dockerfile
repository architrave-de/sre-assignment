# Download base image Alpine
FROM mysql

MAINTAINER Tejas Gadaria

# Setting up Environemnt Variable
ENV MYSQL_ROOT_PASSWORD: local
ENV MYSQL_DATABASE: localhost
ENV MYSQL_USER: assignment
ENV MYSQL_USER_PASSWORD: assignment

# Install MySQL
RUN groupadd -r mysql && useradd -r -g mysql mysql

# Upload Configuration
COPY config/my.cnf /etc/mysql/

# Allow Mysql to be access from host
EXPOSE 3306

# Deamonize
CMD ["mysqld"]
