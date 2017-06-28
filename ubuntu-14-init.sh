#!/bin/bash

sudo adduser $USER www-data
sudo ufw enable
sudo ufw allow ssh

#General 
####################################################################################################################
sudo apt-get install -y fail2ban shutter xclip git tilda mc htop byobu sshfs
sudo apt-get install -y p7zip-full unrar-free
sudo apt-get install -y synapse vlc

#WGETS
####################################################################################################################

#Install ID card
wget https://installer.id.ee/media/install-scripts/install-open-eid.sh &&
chmod +x install-open-eid.sh &&
./install-open-eid.sh &&
rm install-open-eid.sh

#Google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
sudo dpkg -i --force-depends google-chrome-stable_current_amd64.deb &&
rm google-chrome-stable_current_amd64.deb &&
sudo apt-get -f install


#Add repos
####################################################################################################################
#Themes and docky
sudo add-apt-repository -y ppa:ricotz/docky &&
sudo add-apt-repository -y ppa:numix/ppa &&
#Atom and Sublime
sudo add-apt-repository -y ppa:webupd8team/atom &&
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3 &&
#Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 &&
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list &&

sudo apt-get update &&
sudo apt-get install -y atom sublime-text-installer spotify-client



# NodeJS 6
sudo apt-get install -y build-essential &&
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - &&
sudo apt-get install -y nodejs
echo "NodeJS 6 installed ***************************************************"

# Node packs
# Angular 2 global
sudo npm install -g @angular/cli
sudo npm install -g nodemon


# MongoDB 3
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 &&
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list &&
sudo apt-get update &&
sudo apt-get install -y mongodb-org &&
echo "Mongodb 3.4 installed ***************************************************"

# Robomongo 1.0
wget https://download.robomongo.org/1.0.0/linux/robomongo-1.0.0-linux-x86_64-89f24ea.tar.gz
tar -xvzf robomongo-1.0.0-linux-x86_64-89f24ea.tar.gz
rm robomongo-1.0.0-linux-x86_64-89f24ea.tar.gz
sudo mkdir /usr/local/bin/robomongo
sudo mv  robomongo-1.0.0-linux-x86_64-89f24ea/* /usr/local/bin/robomongo 
sudo chmod +x /usr/local/bin/robomongo/bin/robomongo
echo "alias robomongo='/usr/local/bin/robomongo/bin/robomongo'" >> ~/.bashrc
source ~/.bashrc
