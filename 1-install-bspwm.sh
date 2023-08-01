#!/usr/bin/env bash


# Default packages are for the configuration and corresponding .config folders
# Install packages after installing base Debian with no GUI

# xorg display server installation
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput

# Microcode for Intel/AMD 
# sudo apt install -y amd64-microcode
sudo apt install -y intel-microcode 

# PACKAGE INCLUDES build-essential
sudo apt install -y build-essential meson cmake libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev

# Network File Tools/System Events
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends xfce4-power-manager

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# Authentication Kit
sudo apt install -y policykit-1-gnome

# Network Manager
sudo apt install -y network-manager network-manager-gnome 

# Thunar
sudo apt install -y thunar thunar-archive-plugin thunar-volman

# Terminal (eg. terminator,kitty,xfce4-terminal)
sudo apt install -y kitty

# Sound packages
sudo apt install -y pipewire-audio pavucontrol pamixer

# Neofetch
sudo apt install -y neofetch htop


# Installation for Appearance management
sudo apt install -y lxappearance plymouth plymouth-themes 


# Web Browser Requirement
sudo apt install -y libdbus-glib-1-2


# Desktop background browser/handler 
# feh --bg-fill /path/to/directory 
# sudo apt install -y nitrogen 
sudo apt install -y feh

 
# Fonts and icons for now
sudo apt install -y fonts-recommended fonts-ubuntu fonts-font-awesome fonts-terminus fonts-firacode fonts-noto-color-emoji fonts-liberation2 papirus-icon-theme


# Text Editor (Comment out whichever one you dont want to use)
sudo apt install -y micro
# sudo apt install vim

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --header --color=always --group-directories-first' 
sudo apt install -y exa


# Printing and bluetooth (if needed)
sudo apt install -y cups system-config-printer simple-scan
sudo apt install -y bluez blueman qjackctl

sudo systemctl enable cups
sudo systemctl enable bluetooth


# Packages needed for window manager installation
sudo apt install -y bspwm dmenu sxhkd numlockx rofi dunst polybar libnotify-bin unzip

# my apps
sudo apt install -y geany scrot evince gimp gnome-disk-utility gparted arandr ranger vlc thunderbird inkscape neovim
sudo apt install -y mpv nala redshift timeshift brightnessctl libreoffice stacer tlp tlp-rdw file-roller xdotool playerctl


# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update


mkdir -p ~/.config/{bspwm,sxhkd,dunst,rofi,kitty,picom,polybar}
mkdir -p ~/.local/bin

install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc


# Install Lightdm Console Display Manager
sudo apt install -y lightdm lightdm-gtk-greeter-settings slick-greeter
sudo systemctl enable lightdm


# Flatpak Supprt
sudo apt install flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo


# Copy configurations to default locations
cp ~/backups/Bspwm/bspwmrc ~/.config/bspwm/
cp ~/backups/Sxhkd/sxhkdrc ~/.config/sxhkd/
cp ~/backups/Dunst/dunstrc ~/.config/dunst/
cp ~/backups/Kitty/kitty.conf ~/.config/kitty/
cp ~/backups/Picom/picom.conf ~/.config/picom/
cp ~/backups/Polybar/* ~/.config/polybar/
cp -r ~/backups/Rofi/* ~/.config/rofi/
cp ~/backups/Scripts/* ~/.local/bin/
cp ~/backups/.bashrc ~/

########################################################
# End of script for default config
#


sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thank you.\e[0m\n"
