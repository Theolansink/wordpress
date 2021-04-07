#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install apache2 -y
sudo apt install php libapache2-mod-php php-mysql -y
sudo service apache2 start
sudo systemctl enable apache2
cd /var/www/html
sudo wget http://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz
sudo mv wordpress mysite
cd mysite
sudo cp wp-config-sample.php wp-config.php
sudo sed -i 's/database_name_here/wordpress/g' wp-config.php
sudo sed -i 's/username_here/admin/g' wp-config.php
sudo sed -i 's/password_here/wordpress/g' wp-config.php
sudo sed -i 's/localhost/10.0.1.13/g' wp-config.php
sudo apt install mysql-client-core-8.0 #install mysql client for testing connection
sudo service apache2 restart
