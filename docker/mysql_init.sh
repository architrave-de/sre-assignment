#!/bin/bash
/usr/bin/mysqld_safe --skip-grant-tables &
sleep 5
mysql -u root -e "CREATE USER 'root'@'localhost' IDENTIFIED BY '';"
mysql -u root -e "GRANT ALL PRIVILEGES ON database.* TO 'root'@'localhost';"
mysql -u root -e "CREATE DATABASE assignment;"
mysql -u root -e "CREATE USER 'assignment'@'localhost' IDENTIFIED BY 'local';"
mysql -u root -e "GRANT ALL PRIVILEGES ON database.assignment TO 'assignment'@'localhost';"
mysql -u root -e "CREATE USER 'assignment-read'@'localhost' IDENTIFIED BY 'local2';"
mysql -u root -e "GRANT SELECT,LOCK TABLES/*.*:PROCESS PRIVILEGES ON database.assignment TO 'assignment-read'@'localhost';"