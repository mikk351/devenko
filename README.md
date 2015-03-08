# devEnvConf
  
General

	sudo apt-get install git chromium-browser vlc indicator-cpufreq thinkfan mc p7zip-full unrar-free htop

Sublime
    
	sudo add-apt-repository ppa:webupd8team/sublime-text-3 &&
	sudo apt-get update &&
	sudo apt-get install sublime-text-installer

Spotify
  
	sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free" &&
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59 &&
	sudo apt-get update -qq &&
	sudo apt-get install spotify-client

Node and apache
  
	sudo apt-get install apache2 nodejs-legacy npm
  
Node pacs

	sudo npm install -g grunt-cli &&
	sudo npm install -g bower &&
	sudo npm install -g yo

User rights

	#!/bin/bash
	
	sudo a2enmod rewrite
	sudo a2enmod userdir
	sudo service apache2 reload
	sudo adduser $USER www-data
	sudo chown -R www-data:www-data /home/$USER/kood
	sudo chmod -R 775 /home/$USER/kood
