#!/usr/bin/env bash

cd /etc/yum.repos.d/ && sudo wget https://copr.fedorainfracloud.org/coprs/trixieua/mutter-patched/repo/fedora-$(rpm -E %fedora)/trixieua-mutter-patched-fedora-$(rpm -E %fedora).repo && sudo rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:trixieua:mutter-patched gnome-shell mutter mutter-common xorg-x11-server-Xwayland gdm
wget https://copr.fedorainfracloud.org/coprs/gloriouseggroll/nvidia-explicit-sync/repo/fedora-$(rpm -E %fedora)/gloriouseggroll-nvidia-explicit-sync-fedora-$(rpm -E %fedora).repo?arch=x86_64 -O /etc/yum.repos.d/_copr_gloriouseggroll-nvidia-explicit-sync.repo
rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:gloriouseggroll:nvidia-explicit-sync xorg-x11-server-Xwayland
rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:gloriouseggroll:nvidia-explicit-sync egl-wayland
rm /etc/yum.repos.d/_copr_gloriouseggroll-nvidia-explicit-sync.repo 
