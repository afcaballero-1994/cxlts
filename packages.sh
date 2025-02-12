#!/bin/bash

set -ouex pipefail

dnf install -y fuse selinux-policy git distrobox neovim emacs ffmpeg-free

dnf install -y --nobest @"KDE Plasma Workspaces"
#systemctl enable sddm.service
