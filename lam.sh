#!/bin/bash
sudo apt update
sudo apt -y install apache2 libapache2-mod-php8.1 php8.1 php8.1-mysql php8.1-cli php8.1-common php8.1-xml php8.1-curl php8.1-mbstring
sudo a2enconf php8.1
sudo systemctl reload apache2
wget https://github.com/LDAPAccountManager/lam/releases/download/8.5/ldap-account-manager_8.5-1_all.deb
sudo apt install ./ldap-account-manager_8.5-1_all.deb -y
sudo sed -i 's/^\s*Require all granted/#Require all granted/' /etc/apache2/conf-enabled/ldap-account-manager.conf
sudo sed -i '/^#R.*/a Require ip 127.0.0.1 192.168.125.0/24' /etc/apache2/conf-enabled/ldap-account-manager.conf
sudo systemctl restart apache2
