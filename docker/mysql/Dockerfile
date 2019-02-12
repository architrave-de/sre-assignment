# Download base image Alpine
FROM mysql

MAINTAINER Tejas Gadaria

# Install MySQL
RUN groupadd -r mysql && useradd -r -g mysql mysql

# Upload Configuration
COPY config/my.cnf /etc/mysql/

# Allow Mysql to be access from host
EXPOSE 3306

# Deamonize
CMD ["mysqld"]
