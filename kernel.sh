#!/bin/bash

set -ouex pipefail

dnf install -y \
    wget \
    kernel-devel \
    kernel-headers \
    dkms \
    vulkan \
    vulkan-tools \
    vulkan-headers \
    vulkan-loader-devel

kver=$(cd /usr/lib/modules && echo * | awk '{print $NF}')
dracut -vf /usr/lib/modules/$kver/initramfs.img $kver

dnf remove $(dnf repoquery --installonly --latest-limit=-1 -q) -y
