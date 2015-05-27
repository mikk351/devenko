# devEnvConf
  
General

	sudo apt-get install git chromium-browser vlc indicator-cpufreq thinkfan mc p7zip-full unrar-free htop

Grunt ENOSPC error
	
	echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
