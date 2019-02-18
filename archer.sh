sudo pacman -S chromium flameshot code atom docker nodejs npm yaourt xclip --noconfirm

# install? flatpak
yaourt -S qdigidoc4 chrome-token-signing --noconfirm
yaourt -S spotify sublime-text-dev pulseaudio-dlna --noconfirm

sudo systemctl enable pcscd
sudo systemctl start pcscd

sudo systemctl enable docker
sudo systemctl start docker

sudo pip install docker-compose
sudo npm install -g @angular/cli http-server
