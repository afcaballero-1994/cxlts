#!/bin/bash

set -ouex pipefail

dnf install -y @"KDE Plasma Workspaces" fuse selinux-policy git distrobox firefox neovim emacs fzf fastfetch
systemctl enable sddm.service
