# devEnvConf
  
General

	sudo apt-get install git chromium-browser vlc indicator-cpufreq thinkfan mc p7zip-full unrar-free htop

Grunt ENOSPC error
	
	echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p



git config --global alias.force-pull '!git fetch --all && git reset --hard origin/master'

git config --global alias.a '!git add -A && git commit'

ulimit -v 4000000 # Ubuntu memory full freez fix


phantomJS font problems:
	apt-get install fontconfig libfontconfig-dev libfontenc-dev libfontenc1 libxfont-dev libxfont1 xfonts-base xfonts-100dpi xfonts-75dpi xfonts-cyrillic ttf-mscorefonts-installer libxext-dev libwayland-dev
