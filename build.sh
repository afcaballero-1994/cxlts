#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1


#https://docs.fedoraproject.org/en-US/bootc/home-directories/
mkdir -p -m 0700 /var/roothome

# this installs a package from fedora repos

/tmp/repos.sh
/tmp/flatpak.sh
/tmp/packages.sh

sed -i 's,ExecStart=/usr/bin/bootc update --apply --quiet,ExecStart=/usr/bin/bootc update --quiet,g' \
    /usr/lib/systemd/system/bootc-fetch-apply-updates.service


mv /opt /var/opt && \
  ln -s /var/opt /opt


mv /usr/local /var/usrlocal && \
  ln -s /var/usrlocal /usr/local

/tmp/kernel.sh

#cleanup
shopt -s extglob
rm -rf /var/roothome
rm -rf /var/!(cache)
rm -rf /var/cache/!(rpm-ostree)
rm -rf /var/tmp
dnf clean all

systemctl disable rpm-ostree-countme.service

