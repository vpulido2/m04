#!/bin/bash
sudo apt update
sudo apt -y install apache2 php php-cgi libapache2-mod-php php-mbstring php-common php-pear
sudo a2enconf php7.4-cgi
sudo systemctl reload apache2
wget https://github.com/LDAPAccountManager/lam/releases/download/8.5/ldap-account-manager_8.5-1_all.deb
sudo apt install ./ldap-account-manager_8.5-1_all.deb -y
sudo sed -i 's/^\s*Require all granted/#Require all granted/' /etc/apache2/conf-enabled/ldap-account-manager.conf
sudo sed -i '/^#R.*/a Require ip 127.0.0.1 192.168.125.0/24' /etc/apache2/conf-enabled/ldap-account-manager.conf
sudo systemctl restart apache2
