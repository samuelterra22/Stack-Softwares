#!/bin/bash
echo "########################################################"
echo "#                                                      #"
echo "#  Instalação de pacotes e programas após formatação   #"
echo "#     ou instalação limpa do sistema operaconal.       #"
echo "#                                                      #"
echo "#  Autor:     Samuel Terra                             #"
echo "#                                                      #"
echo "#  Github:    https://github.com/SamuelTerra22         #"
echo "#  Twitter:   https://twitter.com/samuelterra22        #"
echo "#  Facebook:  https://www.facebook.com/SamuelTerra22   #"
echo "#                                                      #"
echo "#                                                      #"
echo "########################################################"
echo "#                                                      #"
echo "#  Os seguintes pacotes serão instalados:              #"
echo "#                                                      #"
echo "#  * PHP 7.1                                           #"
echo "#  * Apache2                                           #"
echo "#  * MySql                                             #"
echo "#  * MySql Workbench                                   #"
echo "#  * Python 3                                          #"
echo "#  * htop                                              #"
echo "#  * zip                                               #"
echo "#  * SpeedTest                                         #"
echo "#  * Git                                               #"
echo "#  * Composer                                          #"
echo "#  * R                                                 #"
echo "#  * Sublime-text                                      #"
echo "#  * Spotify                                           #"
echo "#                                                      #"
echo "#                                                      #"
echo "########################################################"

echo "Aperte qualquer tecla para continuar com a instalação ou CTRL+C para cancelar."
read nothing

echo "########################################################"
echo "              Criando pasta temporária                  "
echo "########################################################"

mkdir "temp/"

echo "########################################################"
echo "     Realzando download do Workbeanch em background     "
echo "########################################################"

wget -bc -O "Workbeanch.deb" "https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.3.9-1ubuntu16.04-amd64.deb"

echo "########################################################"
echo "     Realzando download do PhpStorm em background       "
echo "########################################################"

# 261 Mb
wget -bc -O "PhpStorm.tar.gz" "https://data.services.jetbrains.com/products/download?code=PS&platform=linux"

echo "########################################################"
echo "     Realzando download do PyCharm em background       "
echo "########################################################"

# 191 Mb
wget -bc -O "PyCharm.tar.gz" "https://data.services.jetbrains.com/products/download?code=PCP&platform=linux"

echo "########################################################"
echo "               Instalando PHP e Apache                 "
echo "########################################################"

sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update

sudo apt-get install -y php7.1-mbstring php7.1-xml libapache2-mod-php php7.1-cli php7.1-common libapache2-mod-php7.1 php7.1 php7.1-mysql php7.1-fpm php7.1-curl php7.1-gd php7.1-bz2 apache2

# Ativando php7.1 module
sudo a2enmod php7.1

# Ativando mod rewrite
sudo a2enmod rewrite

echo "########################################################"
echo "		   Configurando MYSQL - Password: 'root'          "
echo "########################################################"

# Seta o usuário e senha do MySQL para root
echo "mysql-server-5.7 mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password root" | debconf-set-selections
sudo apt-get -y install mysql-server-5.7

echo -e "\n"

echo "Reiniciando Apache2 e Mysql"
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
echo "                   Instalando R                         "
echo "########################################################"

sudo apt install -f r-base-core

echo "########################################################"
echo "              Instalando Sublime-text                   "
echo "########################################################"

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text

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

sudo dpkg -i "Workbeanch.deb"
sudo apt-get install -f

echo "########################################################"
echo "               Instalando o PhpStorm                  "
echo "########################################################"

tar -xzvf PhpStorm.tar.gz -C temp/
mv temp/PhpStorm-* temp/PhpStorm/
mv temp/PhpStorm/ /opt/

echo "########################################################"
echo "               Instalando o PyCharm                  "
echo "########################################################"

tar -xzvf PyCharm.tar.gz -C temp/
mv temp/PhpStorm-* temp/PyCharm/
mv temp/PyCharm/ /opt/

echo "########################################################"
echo "		           Atualizando o sistema                  "
echo "########################################################"

sudo apt-get update
sudo apt-get -y dist-upgrade

echo "########################################################"
echo "		   Limpando arquivos de instalação e cache        "
echo "########################################################"

sudo rm -rf "temp/"
sudo rm wget-log Workbeanch.deb
sudo apt-get autoclean -y
sudo apt-get autoremove -y

echo -e "\n"

if [ $? -ne 0 ]; then
   echo "Verifique os serviços instalados, há alguns $(tput bold)$(tput setaf 1)problema$(tput sgr0)"
else
   echo "Serviços instalados estão sendo executados com $(tput bold)$(tput setaf 2)sucesso$(tput sgr0)"
fi

