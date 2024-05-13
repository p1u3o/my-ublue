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

curl -Lo /tmp/starship.tar.gz "https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz" 
tar -xzf /tmp/starship.tar.gz -C /tmp
install -c -m 0755 /tmp/starship /usr/bin
echo 'eval "$(starship init bash)"' >> /etc/bashrc

rpm-ostree override replace \
--experimental \
--from repo=copr:copr.fedorainfracloud.org:ublue-os:staging \
    mutter \
    mutter-common

rpm-ostree override replace \
    --experimental \
    --from repo=copr:copr.fedorainfracloud.org:ublue-os:staging \
        gnome-shell
