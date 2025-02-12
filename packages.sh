#!/bin/bash

set -ouex pipefail

dnf install -y fuse selinux-policy git distrobox sddm neovim emacs
#systemctl enable sddm.service
