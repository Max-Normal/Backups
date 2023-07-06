#!/usr/bin/env bash


# Install script for Applications

sudo apt update


# Firefox Install

cd ~/backups/resources/

tar xjf firefox-*.tar.bz2
sudo mv firefox /opt
sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox
sudo wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/install-firefox-linux/firefox.desktop -P /usr/local/share/applications


#Cascadia Font Install

sudo apt install -y ./fonts-cascadia-code.deb


# Rust Language Install

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

# FDM Install

sudo apt install -y ./freedownloadmanager.deb


# Bitwarden Install

sudo apt install -y ./Bitwarden.deb


# Setup Qemu 
sudo apt install qemu-kvm qemu-system qemu-utils python3 python3-pip libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y
sudo systemctl status libvirtd.service
sudo virsh net-start default
sudo virsh net-autostart default
sudo usermod -aG libvirt $USER
sudo usermod -aG libvirt-qemu $USER
sudo usermod -aG kvm $USER
sudo usermod -aG input $USER
sudo usermod -aG disk $USER


# Steam Install
sudo apt install -y ./steam_latest.deb
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt install libgl1-mesa-dri:i386 libgl1:i386
sudo apt-get upgrade steam -f
sudo apt install nvidia-driver-libs:i386

# Lutris Install

echo 'deb http://download.opensuse.org/repositories/home:/strycore/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/home:strycore.list
curl -fsSL https://download.opensuse.org/repositories/home:strycore/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_strycore.gpg > /dev/null
sudo apt update
sudo apt install -y lutris

# ProtonUP-QT Flatpak Install

sudo apt update && sudo flatpak install ./net.davidotek.pupgui2.flatpakref


# Bottles Flatpak Install

sudo apt update && sudo flatpak install ./com.usebottles.bottles.flatpakref


# VS Code Install

sudo apt install -y ./code.deb


# Discord Install

sudo apt install -y ./discord.deb


# Github Desktop Install

sudo apt install -y ./GitHubDesktop.deb


# Powershell Install

sudo apt install -y ./powershell.deb


# Spotify Client Install

curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update && sudo apt install -y spotify-client
