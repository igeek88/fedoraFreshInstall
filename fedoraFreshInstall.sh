#!/bin/bash

dnf makecache
dnf -y update
dnf -y upgrade
dnf -y install wget vim terminator curl dnf-plugin-system-upgrade gpg keepass
cp .bash_aliases /etc/.bash_aliases
cp .bashrc /etc/.bashrc
source /etc/.bash_aliases /etc/.bashrc
mkdir -vp /home/dl/installers
cd /home/dl/installers
wget -vdc https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf -y install ./google-chrome-stable_current_x86_64.rpm
rm -rvi /home/dl
