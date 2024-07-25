sudo pacman -Sy smbclient flatpak code docker docker-compose python-pip fish fzf cifs-utils --noconfirm
#sudo pacman -Sy cups splix system-config-printer --noconfirm
sudo pacman -Sy nodejs npm --noconfirm
sudo pacman -Sy base-devel --noconfirm

# VPN
#sudo pacman -S networkmanager-openvpn  openvpn

#sudo pacman -R evolution-data-server folks gnome-maps gnome-contacts
sudo usermod -G docker -a $USER

sudo systemctl enable docker
sudo systemctl start docker

chsh -s /usr/bin/fish # Set deffault shell

# install? flatpak
#pikaur -S spotify sublime-text-dev --noconfirm
#pikaur -S pulseaudio-dlna --noconfirm

# drawing
#flatpak install flathub com.github.maoschanz.drawing

# SmartCard
#pikaur -S qdigidoc4 chrome-token-signing --noconfirm
#sudo systemctl enable pcscd && sudo systemctl start pcscd

# Local pip and npm

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'


# Add user bin to path $HOME/.local/bin
printf '#!/bin/bash\nPATH=$PATH:$HOME/.local/bin:$HOME/.npm-global/bin\n' | sudo tee -a /etc/profile.d/custom.sh > /dev/null
source /etc/profile.d/custom.sh
sudo chmod a+x /etc/profile.d/  



pip install --user docker-compose
npm install -g @angular/cli @vue/cli http-server firebase-tools


# Pikaur
sudo pacman -Sy --needed base-devel git --noconfirm
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri
cd ..
rm -R pikaur

# For fish
fish_add_path $HOME/.npm-global/bin
fish_add_path $HOME/.local/bin
