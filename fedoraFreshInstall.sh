#!/bin/bash

# dnf commands to upgrade system
sudo dnf makecache
sudo dnf -y update
sudo dnf -y upgrade

# dnf command to install some software I usually use
sudo dnf -y install \
	wget vim terminator curl sudo dnf-plugin-system-upgrade gpg keepass kernel-devel kernel-headers gcc make dkms flatpak \
	acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig vdpauinfo libva-vdpau-driver libva-utils xclip gimp pwgen

# Copying .bash_aliases on this repo to user's home directory; Maybe a combination with cat and appending unique values might be better; I did this a while ago so maybe I had my reason to do it like this, can't remember right now.
cp .bash_aliases ~/.bash_aliases

# Adding addToBashrc contents to .bashrc file in users' home directory
cat addToBashrc >> ~/.bashrc

# Sourcing files so their content is readily availabe
source ~/.bash_aliases ~/etc/.bashrc

# Creating a directory to put some installers inside and switching to it
mkdir -vp /home/dl/installers
cd /home/dl/installers

# Download and installation of Google Chrome Browser
wget -vdc https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf -y install ./google-chrome-stable_current_x86_64.rpm

# Removing folder 
rm -rvi /home/dl

# Adding flatpak repository (needs flatpak package installed beforehand) and installs Spotify.
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub com.spotify.Client
