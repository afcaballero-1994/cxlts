#!/bin/bash

set -ouex pipefail

dnf install -y @"KDE Plasma Workspaces" fuse selinux-policy git distrobox firefox neovim
systemctl enable sddm.service
