#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

ln -sf /usr/bin/ld.bfd /etc/alternatives/ld && ln -sf /etc/alternatives/ld /usr/bin/ld

KERNEL_NAME='kernel-core'
ARCH="$(rpm -E '%_arch')"
KERNEL="$(rpm -q "${KERNEL_NAME}" --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"
RELEASE="$(rpm -E '%fedora')"

akmods --force --kernels "${KERNEL}" --kmod wl
akmods --force --kernels "${KERNEL}" --kmod openrgb
akmods --force --kernels "${KERNEL}" --kmod openrazer
akmods --force --kernels "${KERNEL}" --kmod winesync
modinfo /usr/lib/modules/${KERNEL}/extra/wl/wl.ko.xz > /dev/null \
|| (find /var/cache/akmods/wl/ -name \*.log -print -exec cat {} \; && exit 1)
