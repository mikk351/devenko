sudo apt update
sudo apt install -y htop byobu curl fish
curl -fsSL https://deb.nodesource.com/setup_23.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
sudo apt-get install -y nodejs

sudo usermod -aG docker $USER


npm install -g @angular/cli http-server nodemon

sudo chsh -s /usr/bin/fish
fish -c fish_add_path $HOME/.npm-global/bin
fish -c fish_add_path $HOME/.local/bin
