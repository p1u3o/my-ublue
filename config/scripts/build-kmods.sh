#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

ARCH="$(rpm -E '%_arch')"
KERNEL="$(rpm -q "${KERNEL_NAME}" --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"
RELEASE="$(rpm -E '%fedora')"

akmods --force --kernels "${KERNEL}" --kmod wl
modinfo /usr/lib/modules/${KERNEL}/extra/wl/wl.ko.xz > /dev/null \
|| (find /var/cache/akmods/wl/ -name \*.log -print -exec cat {} \; && exit 1)
