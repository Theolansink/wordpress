#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install mysql-server -y
cd /etc/mysql/mysql.conf.d
sudo sed -i 's/127.0.0.1/10.0.1.13/g' mysqld.cnf
sudo mysql -e "CREATE DATABASE wordpress;"
sudo mysql -e "CREATE USER 'admin'@'10.0.1.12' IDENTIFIED BY 'wordpress';"
sudo mysql -e "GRANT ALL PRIVILEGES ON wordpress.*  TO 'admin'@'10.0.1.12';"
sudo mysql -e "FLUSH PRIVILEGES;"
cd ~
sudo service mysql restart

