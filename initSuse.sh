
# General 
# ----------------------------------------------------------------------------------
sudo zypper install -y opera vim mc htop chromium fish nodejs10 flameshot sshfs tilda byobu xclip wine p7zip git

# SUBLIME 
# ----------------------------------------------------------------------------------
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo zypper addrepo -g -f https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo zypper install  -y sublime-text

# DOCKER 
# ----------------------------------------------------------------------------------
sudo zypper install -y docker docker-compose
sudo systemctl enable docker
sudo usermod -G docker -a deller

# Flat Stuff 
# ----------------------------------------------------------------------------------
sudo zypper install -y flatpak xdg-desktop-portal xdg-desktop-portal-gtk gnome-software 

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
#flatpak remote-add --if-not-exists nuvola https://dl.tiliado.eu/flatpak/nuvola.flatpakrepo
flatpak update

flatpak install flathub com.github.maoschanz.drawing -y


# VS CODE 
# ----------------------------------------------------------------------------------
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'

sudo zypper refresh
sudo zypper install -y code


# Local pip and npm installs
# ----------------------------------------------------------------------------------
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

# Add user bin to path $HOME/.local/bin
printf '#!/bin/bash\nPATH=$PATH:$HOME/.local/bin:$HOME/.npm-global/bin\n' | sudo tee -a /etc/profile.d/custom.sh > /dev/null
source /etc/profile.d/custom.sh
sudo chmod a+x /etc/profile.d/  

# FISH
# ----------------------------------------------------------------------------------
chsh -s /usr/bin/fish # Set deffault shell
printf '\nset -gx PATH $PATH:$HOME/.local/bin:$HOME/.npm-global/bin\n' | tee -a ~/.config/fish/config.fish > /dev/null

# rm ~/.config/autostart/create-template.desktop # generates empty files

# Hide items
echo snap >> ~/.hidden

# SNAP
# ----------------------------------------------------------------------------------
sudo zypper addrepo --refresh https://download.opensuse.org/repositories/system:/snappy/openSUSE_Leap_15.0 snappy
sudo zypper --gpg-auto-import-keys refresh
sudo zypper dup --from snappy
sudo zypper install snapd
sudo systemctl enable snapd
sudo systemctl start snapd
sudo systemctl enable snapd.apparmor
sudo systemctl start snapd.apparmor
sudo snap install snap-store

snap install spotify

# NPM packs
# ----------------------------------------------------------------------------------
npm install -g @angular/cli @vue/cli http-server

# CONF
# ----------------------------------------------------------------------------------
wget https://raw.githubusercontent.com/mikk351/devenko/master/keybindings.json -O ~/.config/Code/User/keybindings.json


# KEY
# ----------------------------------------------------------------------------------
git config --global user.email "mikk351@gmail.com" &&
git config --global user.name "mikkk" &&
git config --global push.default simple &&
ssh-keygen -t rsa -b 4096 -C "mikk351@gmail.com" &&
eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa &&
xclip -sel clip < ~/.ssh/id_rsa.pub
