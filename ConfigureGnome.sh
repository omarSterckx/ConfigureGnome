#!/bin/bash
#
# This script is written to download, install and configure as much of the system and it's applications as needed by Jan Peters
#
# First of all make sure the system is up to disable-mate

sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y

#install power optimizer
sudo apt install tlp tlp-rdw

# Collect and install must have apps
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
sudo echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo add-apt-repository -y ppa:webupd8team/terminix
sudo add-apt-repository -y ppa:webupd8team/atom
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-key adv --keyserver pool.sks-keyservers.net --recv 6DDA23616E3FE905FFDA152AE61DA9241537994D
echo "deb https://dl.bintray.com/aluxian/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/aluxian.list
sudo apt update
sudo apt install -y albert atom google-chrome-stable spotify-client mesengerfordesktop tilix vlc android-tools-adb android-tools-fastboot autoconf automake htop libgtk-3-dev git openjdk-8-jdk pkg-config virtualbox virtualbox-dkms virtualbox-ext-pack virtualbox-guest-additions-iso virtualbox-guest-utils

# block invasive Adware
echo "# Invasive Adware
127.0.0.1 ads.pubmatic.com
127.0.0.1 gads.pubmatic.com
127.0.0.1 pubads.g.doubleclick.net
127.0.0.1 securepubads.g.doubleclick.net
127.0.0.1 spclient.wg.spotify.com
127.0.0.1 www.googletagservices.com
" | sudo tee -a /etc/hosts

# Disable apport
echo "enabled=0" | sudo tee /etc/default/apport

# Install various extensions
mkdir ~/.local/share/gnome-shell/extensions

# clipboard-indicator
wget -O /tmp/clipboard-indicator.zip https://extensions.gnome.org/download-extension/clipboard-indicator@tudmotu.com.shell-extension.zip?version_tag=7508
unzip -o /tmp/clipboard-indicator.zip -d ~/.local/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com

# dash-to-dock
wget -O /tmp/dash-to-dock.zip https://extensions.gnome.org/download-extension/dash-to-dock@micxgx.gmail.com.shell-extension.zip?version_tag=7315
unzip -o /tmp/dash-to-dock.zip -d ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com

# dynamicTopBar
wget -O /tmp/dynamicTopBar.zip https://extensions.gnome.org/download-extension/dynamicTopBar@gnomeshell.feildel.fr.shell-extension.zip?version_tag=5866
unzip -o /tmp/dynamicTopBar.zip -d ~/.local/share/gnome-shell/extensions/dynamicTopBar@gnomeshell.feildel.fr

# Hide_Activities
wget -O /tmp/Hide_Activities.zip https://extensions.gnome.org/download-extension/hide-activities-button@gnome-shell-extensions.bookmarkd.xyz.shell-extension.zip?version_tag=6354
unzip -o /tmp/Hide_Activities.zip -d ~/.local/share/gnome-shell/extensions/hide-activities-button@gnome-shell-extensions.bookmarkd.xyz

# nohotcorner
wget -O /tmp/nohotcorner.zip https://extensions.gnome.org/download-extension/nohotcorner@azuri.free.fr.shell-extension.zip?version_tag=7498
unzip -o /tmp/nohotcorner.zip -d ~/.local/share/gnome-shell/extensions/nohotcorner@azuri.free.fr

# places-menu
wget -O /tmp/places-menu.zip https://extensions.gnome.org/download-extension/places-menu@gnome-shell-extensions.gcampax.github.com.shell-extension.zip?version_tag=6866
unzip -o /tmp/places-menu.zip -d ~/.local/share/gnome-shell/extensions/places-menu@gnome-shell-extensions.gcampax.github.com

# refresh-wifi
wget -O /tmp/refresh-wifi.zip https://extensions.gnome.org/download-extension/refresh-wifi@kgshank.net.shell-extension.zip?version_tag=6420
unzip -o /tmp/refresh-wifi.zip -d ~/.local/share/gnome-shell/extensions/refresh-wifi@kgshank.net

# remove-dropdown-arrows
wget -O /tmp/remove-dropdown-arrows.zip https://extensions.gnome.org/download-extension/remove-dropdown-arrows@mpdeimos.com.shell-extension.zip?version_tag=6397
unzip -o /tmp/remove-dropdown-arrows.zip -d ~/.local/share/gnome-shell/extensions/remove-dropdown-arrows@mpdeimos.com

# steal-my-focus
wget -O /tmp/steal-my-focus.zip https://extensions.gnome.org/download-extension/steal-my-focus@kagesenshi.org.shell-extension.zip?version_tag=6009
unzip -o /tmp/steal-my-focus.zip -d ~/.local/share/gnome-shell/extensions/steal-my-focus@kagesenshi.org

# straighttopbar
wget -O /tmp/straighttopbar.zip https://extensions.gnome.org/download-extension/straighttopbar@peclu.net.net.shell-extension.zip?version_tag=7137
unzip -o /tmp/straighttopbar.zip -d ~/.local/share/gnome-shell/extensions/straighttopbar@peclu.net.net

# workspaces-to-dock
wget -O /tmp/workspaces-to-dock.zip https://extensions.gnome.org/download-extension/workspaces-to-dock@passingthru67.gmail.com.shell-extension.zip?version_tag=6940
unzip -o /tmp/workspaces-to-dock.zip -d ~/.local/share/gnome-shell/extensions/workspaces-to-dock@passingthru67.gmail.com

# Enable default installed and just installed extensions
gsettings set org.gnome.shell enabled-extensions "['clipboard-indicator@tudmotu.com', 'Hide_Activities@shay.shayel.org', 'nohotcorner@azuri.free.fr', 'refresh-wifi@kgshank.net', 'steal-my-focus@kagesenshi.org', 'straighttopbar@peclu.net.net', 'workspaces-to-dock@passingthru67.gmail.com', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'remove-dropdown-arrows@mpdeimos.com', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'extendedgestures@mpiannucci.github.com', 'ShellTile@emasab.it', 'dynamicTopBar@gnomeshell.feildel.fr', 'dash-to-dock@micxgx.gmail.com']"


# Install gtk theme (matcha)
git clone https://github.com/omarSterckx/matcha /tmp/matcha
/tmp/matcha/Install
gsettings set org.gnome.shell.extensions.user-theme name 'Matcha-Dark'

# Set global dark theme
echo -e "[Settings]\ngtk-application-prefer-dark-theme=1" | tee ~/.config/gtk-3.0/settings.ini

# Icon theme
git clone https://github.com/system76/pop-icon-theme.git /tmp/pop-icon-theme
(cd /tmp/pop-icon-theme && sudo make install)
(cd /tmp/pop-icon-theme && sudo make post-install)
gsettings set org.gnome.desktop.interface icon-theme 'Pop'

# Cursor theme
wget -O /tmp/numix-cursor-theme.zip https://codeload.github.com/numixproject/numix-cursor-theme/zip/master
unzip /tmp/numix-cursor-theme.zip -d /tmp/numix-cursor
sudo mv /tmp/numix-cursor/numix-cursor-theme-master/Numix-Light /usr/share/icons
gsettings set org.gnome.desktop.interface cursor-theme 'Numix-Light'


# Stremio
wget -O /tmp/stremio.tar.gz http://dl.strem.io/Stremio3.6.5.linux.tar.gz
sudo mkdir /opt/Stremio
sudo tar -xf /tmp/stremio.tar.gz -C /opt/Stremio/
echo "[Desktop Entry]
  Type=Application
Name=Stremio
Comment=Stream media content
Icon=/usr/share/icons/Pop/48x48@2x/apps/stremio.svg
Exec=/opt/Stremio/Stremio.sh
Terminal=false
Categories=Entertainment;
" | tee ~/.local/share/applications/stremio.desktop

# YakYak
wget -O /tmp/yakyak.tar.gz https://github.com/yakyak/yakyak/releases/download/v1.4.4/yakyak-1.4.4-linux-x64.tar.gz
sudo mkdir /opt/YakYak
sudo tar -xf /tmp/yakyak.tar.gz -C /tmp/YakYak/
echo "[Desktop Entry]
Type=Application
Name=YakYak
Comment=Hangouts client
Icon=/usr/share/icons/Pop/48x48@2x/apps/chrome-knipolnnllmklapflnccelgolnpehhpl-Default.svg
Exec=/opt/YakYak/yakyak
Terminal=false
Categories=Communication;
" | tee ~/.local/share/applications/yakyak.desktop

# Atom plugins
apm install atom-beautify
apm install autocomplete-paths
apm install busy-signal
apm install emmet
apm install highlight-selected
apm install intentions
apm install pigments
apm install atom-material-syntax-dark
apm install atom-material-ui

# Make albert launch at login
sudo cp /usr/share/applications/albert.desktop ~/.config/autostart/albert.desktop

# Make tilix the default terminal emulator
gsettings set org.gnome.desktop.default-applications.terminal exec 'tilix'

# Set wallpaper
wget /Documents https://github.com/omarSterckx/ConfigureGnome/blob/master/Animals-snow-leopard-Full-HD-1920x1080-Wallpapers-download-desktop-wallpapers-amazing-background-images-mac-desktop-wallpapers-free-pictures-smart-phone-1920x1080.jpg
gsettings set org.gnome.desktop.background picture-uri file:///home/omar/Documents/Animals-snow-leopard-Full-HD-1920x1080-Wallpapers-download-desktop-wallpapers-amazing-background-images-mac-desktop-wallpapers-free-pictures-smart-phone-1920x1080.jpg

# Finish off in a clean manner
sudo apt autoremove -y
clear
echo "Don't forget to configure the extensions to your liking and sign in to new apps"
echo "Your pc will restart in 10 seconds"
sleep 10 &
reboot
