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
echo "#  Lattes:    http://lattes.cnpq.br/3974566012526176   #"
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
echo "#  * rar                                               #"
echo "#  * unrar                                             #"
echo "#  * SpeedTest                                         #"
echo "#  * Git                                               #"
echo "#  * Composer                                          #"
echo "#  * R                                                 #"
echo "#  * Sublime-text                                      #"
echo "#  * Spotify                                           #"
echo "#  * PhpStorm                                          #"
echo "#  * PyCharm                                           #"
echo "#  * DataGrip                                          #"
echo "#  * My Weather Indicator                              #"
echo "#  * Atom                                              #"
echo "#  * Pulse Audio Equalizer                             #"
echo "#  * Gimp                                              #"
echo "#  * GParted                                           #"
echo "#  * iftop                                             #"
echo "#  * vnstati                                           #"
echo "#  * nethogs                                           #"
echo "#                                                      #"
echo "#                                                      #"
echo "#                                                      #"
echo "########################################################"

notify-send 'Instação iniciada' 'Aperte qualquer tecla para continuar com a instalação ou CTRL+C para cancelar.' --icon=dialog-information
echo "Aperte qualquer tecla para continuar com a instalação ou CTRL+C para cancelar."
read nothing

echo "########################################################"
echo "              Criando pasta temporária                  "
echo "########################################################"

mkdir "temp/"

echo "########################################################"
echo "     Realizando download do Workbeanch em background    "
echo "########################################################"

notify-send 'Workbeanch' 'Realizando download do Workbeanch em background.' --icon=dialog-information
wget -bc -O "Workbeanch.deb" "https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.3.9-1ubuntu16.04-amd64.deb"

echo "########################################################"
echo "     Realizando download do PhpStorm em background      "
echo "########################################################"

# 261 Mb
notify-send 'PhpStorm' 'Realizando download do PhpStorm em background.' --icon=dialog-information
wget -bc -O "PhpStorm.tar.gz" "https://data.services.jetbrains.com/products/download?code=PS&platform=linux"

echo "########################################################"
echo "     Realizando download do PyCharm em background       "
echo "########################################################"

# 191 Mb
notify-send 'PyCharm' 'Realizando download do PyCharm em background.' --icon=dialog-information
wget -bc -O "PyCharm.tar.gz" "https://data.services.jetbrains.com/products/download?code=PCP&platform=linux"

echo "########################################################"
echo "     Realizando download do DataGrip em background      "
echo "########################################################"

# 191 Mb
notify-send 'DataGrip' 'Realizando download do DataGrip em background.' --icon=dialog-information
wget -bc -O "DataGrip.tar.gz" "https://data.services.jetbrains.com/products/download?code=DG&platform=linux"

echo "########################################################"
echo "               Instalando PHP e Apache                 "
echo "########################################################"

notify-send 'LAMP' 'Instalando PHP e Apache.' --icon=dialog-information
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

notify-send 'LAMP' 'Instalando MySql.' --icon=dialog-information
# Seta o usuário e senha do MySQL para root
echo "mysql-server-5.7 mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password root" | debconf-set-selections
sudo apt-get -y install mysql-server-5.7

echo -e "\n"

echo "Reiniciando Apache2 e Mysql"
sudo service apache2 restart && service mysql restart > /dev/null

sudo service mysql restart

echo "########################################################"
echo "		     Instalando dependências do python            "
echo "########################################################"

notify-send 'Python' 'Instalando Dependências do Python.' --icon=dialog-information
sudo add-apt-repository ppa:jonathonf/python-3.6 -y
sudo apt-get update
sudo apt-get install -y python-pip python-dev libmysqlclient-dev python3 python3-pip python3.6
sudo apt-get install -y build-essential libbz2-dev libssl-dev libreadline-dev libsqlite3-dev tk-dev
sudo apt-get install -y libpng-dev libfreetype6-dev
sudo pip install --upgrade pip
sudo pip install setuptools
sudo pip install MySQL-python

echo "########################################################"
echo "     Instalando (des)compactadores de arquivos          "
echo "     (zip, rar, unrar)                                  "
echo "########################################################"

notify-send 'zip, rar, nrar' 'Instalando (des)compactadores de arquivos (zip, rar, unrar).' --icon=dialog-information

sudo apt-get -y -q install zip
sudo apt-get -y -q install rar
sudo apt-get -y -q install unrar

echo "########################################################"
echo "           Instalando monitorador de processos          "
echo "########################################################"

notify-send 'htop' 'Instalando monitorador de processos.' --icon=dialog-information

sudo apt install -y htop

echo "########################################################"
echo "                Instalando o SpeedTest                  "
echo "########################################################"

notify-send 'SpeedTest' 'Instalando o SpeedTest.' --icon=dialog-information
wget -O speedtest "https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py"
sudo chmod +x speedtest
sudo mv speedtest /usr/bin/speedtest

echo "########################################################"
echo "                   Instalando Git                       "
echo "########################################################"

notify-send 'Git' 'Instalando Git.' --icon=dialog-information
sudo apt-add-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install -y git

echo "########################################################"
echo "                   Instalando Composer                  "
echo "########################################################"

notify-send 'Composer' 'Instalando Composer.' --icon=dialog-information
sudo apt-get update
sudo apt-get -y install curl
sudo curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "########################################################"
echo "                   Instalando R                         "
echo "########################################################"

notify-send 'R' 'Instalando R.' --icon=dialog-information
sudo apt install -f r-base-core

echo "########################################################"
echo "              Instalando Sublime-text                   "
echo "########################################################"

notify-send 'Sublime-text' 'Instalando Sublime-text.' --icon=dialog-information
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text

echo "########################################################"
echo "                   Instalando Spotify                   "
echo "########################################################"

notify-send 'Spotify' 'Instalando Spotify.' --icon=dialog-information
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install -y spotify-client

echo "########################################################"
echo "                     Instalando Atom                    "
echo "########################################################"

notify-send 'Atom' 'Instalando Atom.' --icon=dialog-information
sudo add-apt-repository ppa:webupd8team/atom -y
sudo apt-get update
sudo apt-get install atom -y

echo "########################################################"
echo "              Instalando My Weather Indicator           "
echo "########################################################"

notify-send 'My Weather Indicator' 'Instalando My Weather Indicator.' --icon=dialog-information
sudo add-apt-repository ppa:atareao/atareao -y
sudo apt-get update
sudo apt-get install my-weather-indicator -y

echo "########################################################"
echo "              Instalando Pulse Audio Equalizer          "
echo "########################################################"

notify-send 'Pulse Audio Equalizer' 'Instalando Pulse Audio Equalizer.' --icon=dialog-information
sudo add-apt-repository ppa:nilarimogard/webupd8 -y
sudo apt-get update
sudo apt-get install pulseaudio-equalizer -y

echo "########################################################"
echo "              Instalando Gimp                           "
echo "########################################################"

notify-send 'Gimp' 'Instalando Gimp.' --icon=dialog-information
sudo apt-get update
sudo apt-get install gimp -y

echo "########################################################"
echo "              Instalando GParted                        "
echo "########################################################"

notify-send 'GParted' 'Instalando GParted.' --icon=dialog-information
sudo apt-get update
sudo apt-get install gparted -y

echo "########################################################"
echo "              Instalando iftop                          "
echo "########################################################"

notify-send 'iftop' 'Instalando iftop.' --icon=dialog-information
sudo apt-get update
sudo apt-get install iftop -y

echo "########################################################"
echo "              Instalando vnstati                          "
echo "########################################################"

notify-send 'vnstati' 'Instalando vnstati.' --icon=dialog-information
sudo apt-get update
sudo apt-get install vnstati -y

echo "########################################################"
echo "              Instalando nethogs                          "
echo "########################################################"

notify-send 'nethogs' 'Instalando nethogs.' --icon=dialog-information
sudo apt-get update
sudo apt-get install nethogs -y

echo "########################################################"
echo "               Instalando o Workbeanch                  "
echo "########################################################"

notify-send 'Workbeanch' 'Instalando Workbeanch.' --icon=dialog-information
sudo dpkg -i "Workbeanch.deb"
sudo apt-get install -f

echo "########################################################"
echo "               Instalando o PhpStorm                    "
echo "########################################################"

notify-send 'PhpStorm' 'Instalando PhpStorm.' --icon=dialog-information
tar -xzvf PhpStorm.tar.gz -C temp/
mv temp/PhpStorm-* temp/PhpStorm/
sudo mv temp/PhpStorm/ /opt/

echo "########################################################"
echo "               Instalando o PyCharm                     "
echo "########################################################"

notify-send 'PyCharm' 'Instalando PyCharm.' --icon=dialog-information
tar -xzvf PyCharm.tar.gz -C temp/
mv temp/PhpStorm-* temp/PyCharm/
sudo mv temp/PyCharm/ /opt/

echo "########################################################"
echo "               Instalando o DataGrip                    "
echo "########################################################"

notify-send 'DataGrip' 'Instalando DataGrip.' --icon=dialog-information
tar -xzvf DataGrip.tar.gz -C temp/
mv temp/DataGrip-* temp/DataGrip/
sudo mv temp/DataGrip/ /opt/

echo "########################################################"
echo "		           Atualizando o sistema                  "
echo "########################################################"

notify-send 'Sistema' 'Atualizando o sistema.' --icon=dialog-information
sudo apt-get update
sudo apt-get -y dist-upgrade

echo "########################################################"
echo "		   Removendo arquivos de instalação e cache       "
echo "########################################################"

notify-send 'Arquivos temporários' 'Removendo arquivos de instalação e cache.' --icon=dialog-information
sudo rm -rf "temp/"
sudo rm wget-log Workbeanch.deb
sudo apt-get autoclean -y
sudo apt-get autoremove -y

echo -e "\n"

if [ $? -ne 0 ]; then
    notify-send 'Instalação terminada!' 'A instalação chegou ao fim e aconteceu algum erro durante a instalação de alguns serviços.' --icon=face-sad
    echo "Verifique os serviços instalados, há alguns $(tput bold)$(tput setaf 1)problema$(tput sgr0)"
else
    notify-send 'Instalação terminada!' 'A instalação terminou e todos os serviços foram instalados!\nÉ recomendado que reinicie o computador. \n\nObrigado pela preferência!' --icon=face-cool
    echo "Serviços instalados estão sendo executados com $(tput bold)$(tput setaf 2)sucesso$(tput sgr0)"
fi

