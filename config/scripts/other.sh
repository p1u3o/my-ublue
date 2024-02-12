#!/usr/bin/env bash

pip install --prefix=/usr yafti
pip install --prefix=/usr topgrade

mkdir -p /usr/etc/flatpak/remotes.d
wget -q https://dl.flathub.org/repo/flathub.flatpakrepo -P /usr/etc/flatpak/remotes.d
sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/user.conf 
sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/system.conf
echo "Hidden=true" >> /usr/share/applications/fish.desktop
echo "Hidden=true" >> /usr/share/applications/htop.desktop 
echo "Hidden=true" >> /usr/share/applications/nvtop.desktop 
echo "Hidden=true" >> /usr/share/applications/gnome-system-monitor.desktop
