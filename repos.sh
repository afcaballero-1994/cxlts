#!/bin/bash

set -ouex pipefail

dnf update -y

dnf config-manager --set-enabled crb -y
dnf install epel-release epel-next-release -y


dnf install distribution-gpg-keys -y

#wait rpm fusion to be available for 10 release
#RPM Fusion (free packages)
#rpmkeys --import /usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$(rpm -E %rhel)
# RPM Fusion (nonfree packages)
#rpmkeys --import /usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-el-$(rpm -E %rhel)

#dnf --setopt=localpkg_gpgcheck=1 install  \
#https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm -y
