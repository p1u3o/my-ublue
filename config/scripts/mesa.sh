#!/usr/bin/env bash

cd /etc/yum.repos.d/ && wget https://copr.fedorainfracloud.org/coprs/che/mesa/repo/fedora-$(rpm -E %fedora)/che-mesa-fedora-$(rpm -E %fedora).repo
rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:che:mesa mesa	vulkan-loader	vulkan-tools libdrm libxcb wayland wayland-protocols xorg-x11-drv-amdgpu	
