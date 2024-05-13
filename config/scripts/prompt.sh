#!/usr/bin/env bash
wget https://copr.fedorainfracloud.org/coprs/kylegospo/prompt/repo/fedora-$(rpm -E %fedora)/kylegospo-prompt-fedora-$(rpm -E %fedora).repo?arch=x86_64 -O /etc/yum.repos.d/_copr_kylegospo-prompt.repo
curl -Lo /etc/yum.repos.d/ublue-os-staging-fedora-$(rpm -E %fedora).repo https://copr.fedorainfracloud.org/coprs/ublue-os/staging/repo/fedora-$(rpm -E %fedora)/ublue-os-staging-fedora-$(rpm -E %fedora).repo

rpm-ostree override replace \
--experimental \
--from repo=copr:copr.fedorainfracloud.org:ublue-os:staging \
    vte291 \
    vte-profile
rpm-ostree install ptyxis
