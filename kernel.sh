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

touch \
    /etc/modprobe.d/nouveau-blacklist.conf

echo "blacklist nouveau" | tee \
    /etc/modprobe.d/nouveau-blacklist.conf

echo "options nouveau modeset=0" | tee -a \
    /etc/modprobe.d/nouveau-blacklist.conf

dracut --force

wget \
    https://us.download.nvidia.com/XFree86/Linux-x86_64/570.86.16/NVIDIA-Linux-x86_64-570.86.16.run

chmod +x NVIDIA-Linux-x86_64-570.86.16.run

kver=$(cd /usr/lib/modules && echo * | awk '{print $NF}')

./NVIDIA-Linux-x86_64-550.144.03.run \
    --silent --run-nvidia-xconfig --dkms \
    --kernel-source-path /usr/src/kernels/$kver \
    --kernel-module-type=proprietary

dracut --force

dracut -vf /usr/lib/modules/$kver/initramfs.img $kver

dnf remove $(dnf repoquery --installonly --latest-limit=-1 -q) -y
