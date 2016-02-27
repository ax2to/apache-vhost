#!/bin/bash

echo "Enter Server Name (Example: myapp.local)"
read serverName

echo "Enter Document Root (Example: /var/wwww/projects/myapp/public)"
read documentRoot

echo "create a file"
sudo echo '<VirtualHost *:80>
  ServerName '$serverName'
  DocumentRoot '$documentRoot'
  <Directory '$documentRoot'>
    AllowOverride all
  </Directory>
</VirtualHost>' >> /etc/apache2/sites-available/$serverName.conf

echo "enable site "$serveName
sudo a2ensite $serverName.conf

sudo echo "127.0.0.1 "$serverName >> /etc/hosts

echo "restart service"
sudo service apache2 restart
