#!/bin/bash

set -ouex pipefail

#https://docs.fedoraproject.org/en-US/bootc/home-directories/
mkdir -p -m 0700 /var/roothome

/tmp/repos.sh
/tmp/flatpak.sh
/tmp/packages.sh

sed -i 's,ExecStart=/usr/bin/bootc update --apply --quiet,ExecStart=/usr/bin/bootc update --quiet,g' \
    /usr/lib/systemd/system/bootc-fetch-apply-updates.service


mv /opt /var/opt && \
  ln -s /var/opt /opt


mv /usr/local /var/usrlocal && \
  ln -s /var/usrlocal /usr/local

#cleanup
shopt -s extglob
rm -rf /var/roothome
rm -rf /var/run
rm -rf /var/tmp
rm -rf /var/cache/!(rpm-ostree)
dnf clean all

