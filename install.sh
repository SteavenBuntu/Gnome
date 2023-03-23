#!/bin/bash

# Gnome Installtion
yes | sudo apt-get install xorg xterm menu synaptic gnome-session gnome-panel metacity gnome-terminal gnome-control-center --no-install-recommends
yes | sudo   apt install gnome-shell-extensions gnome-shell-extension-manager gnome-tweaks nemo xinit git wget papirus-icon-theme gedit pulseaudio network-manager gnome-system-monitor

gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close" 

# fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
sudo unzip FiraCode.zip -d "/usr/share/fonts"
sudo unzip Meslo.zip -d "/usr/share/fonts"
sudo fc-cache -vf
rm ./FiraCode.zip ./Meslo.zip

# theme
sudo git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic
gsettings set org.gnome.desktop.interface gtk-theme Nordic
gsettings set org.gnome.desktop.wm.preferences theme Nordic

# gtk 4 support
wget https://github.com/odziom91/libadwaita-themes/raw/main/nordic/nordic-v42.zip
sudo unzip nordic-v42.zip -d /root/.config/
unzip nordic-v42.zip -d ~/.config/

# snap theme support
sudo snap install gtk-theme-nordic --edge
for i in $(snap connections | grep gtk-common-themes:gtk-3-themes | awk '{print $2}'); do sudo snap connect $i gtk-theme-nordic:gtk-3-themes; done
for i in $(snap connections | grep gtk-common-themes:gtk-4-themes | awk '{print $2}'); do sudo snap connect $i gtk-theme-nordic:gtk-4-themes; done

# icon theme
sudo apt install papirus-icon-theme -y
gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark