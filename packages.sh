#!/bin/bash

set -ouex pipefail

dnf install -y fuse selinux-policy git distrobox neovim emacs
#this does not work using almalinux
#dnf install -y --nobest @"KDE Plasma Workspaces"

dnf install -y @"Workstation"

systemctl enable gdm.service
