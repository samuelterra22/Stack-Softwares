#!/bin/bash

### https://stackoverflow.com/questions/6587507/how-to-install-pip-with-python-3

echo "########################################################"
echo "     Realzando download do Workbeanch em backgroud      "
echo "########################################################"

wget -bc "https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.3.9-1ubuntu16.04-amd64.deb"

echo "########################################################"
echo "               Instalando Serviços LAMP                 "
echo "########################################################"

# Update the repository
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update

# Install Apache, Mysql and Apache
sudo apt-get install -y php7.1-mbstring php7.1-xml libapache2-mod-php php7.1-cli php7.1-common libapache2-mod-php7.1 php7.1 php7.1-mysql php7.1-fpm php7.1-curl php7.1-gd php7.1-bz2 apache2

# Enable php7.1 module
sudo a2enmod php7.1

# Enable mod rewrite
sudo a2enmod rewrite

echo "########################################################"
echo "		   Configurando MYSQL - Password: 'root'          "
echo "########################################################"

# The following commands set the MySQL root password to root when you install the mysql-server package.

echo "mysql-server-5.7 mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password root" | debconf-set-selections
sudo apt-get -y install mysql-server-5.7

# Restart all services
echo -e "\n"

sudo service apache2 restart && service mysql restart > /dev/null

sudo service mysql restart

echo "########################################################"
echo "		     Instalando dependencias do python            "
echo "########################################################"

sudo apt-get update 
sudo apt-get install -y python-pip python-dev libmysqlclient-dev python3 python3-pip
sudo pip install --upgrade pip
sudo pip install setuptools
sudo pip install MySQL-python

echo "########################################################"
echo "      Instalando (des)compactador de arquivos (zip)     "
echo "########################################################"

sudo apt-get -y -q install zip

echo "########################################################"
echo "           Instalando monitorador de processos          "
echo "########################################################"

sudo apt install -y htop

echo "########################################################"
echo "                Instalando o SpeedTest                  "
echo "########################################################"

wget -O speedtest "https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py"
sudo chmod +x speedtest
sudo mv speedtest /usr/bin/speedtest

echo "########################################################"
echo "                   Instalando Git                       "
echo "########################################################"

sudo apt-add-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install -y git

echo "########################################################"
echo "                   Instalando Composer                  "
echo "########################################################"

sudo apt-get update
sudo apt-get -y install curl
sudo curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "########################################################"
echo "                   Instalando R                  "
echo "########################################################"

sudo apt install -f r-base-core

echo "########################################################"
echo "                   Instalando Spotify                   "
echo "########################################################"

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install -y spotify-client

echo "########################################################"
echo "               Instalando o Workbeanch                  "
echo "########################################################"

sudo dpkg -i mysql-workbench-community-6.3.9-1ubuntu16.04-amd64.deb
sudo apt-get install -f

echo "########################################################"
echo "		           Atualizando o sistema                  "
echo "########################################################"

sudo apt-get update
sudo apt-get -y dist-upgrade

echo "########################################################"
echo "		   Limpando arquivos de instalação e cache        "
echo "########################################################"

sudo rm wget-log mysql-workbench-community-6.3.9-1ubuntu16.04-amd64.deb
sudo apt-get autoclean -y
sudo apt-get autoremove -y

echo -e "\n"

if [ $? -ne 0 ]; then
   echo "Please Check the Install Services, There is some $(tput bold)$(tput setaf 1)Problem$(tput sgr0)"
else
   echo "Installed Services run $(tput bold)$(tput setaf 2)Sucessfully$(tput sgr0)"
fi

