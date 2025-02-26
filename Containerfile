FROM ghcr.io/afcaballero-1994/cltx-base-nvidia:latest
#FROM quay.io/centos-bootc/centos-bootc:stream10

## Other possible base images include:
# FROM ghcr.io/ublue-os/bazzite:stable
# FROM ghcr.io/ublue-os/bluefin-nvidia:stable
# 
# ... and so on, here are more base images
# Universal Blue Images: https://github.com/orgs/ublue-os/packages
# Fedora base image: quay.io/fedora/fedora-bootc:41
# CentOS base images: quay.io/centos-bootc/centos-bootc:stream10

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

COPY build.sh /tmp/build.sh
COPY repos.sh /tmp/repos.sh
COPY flatpak.sh /tmp/flatpak.sh
COPY packages.sh /tmp/packages.sh
COPY kernel.sh /tmp/kernel.sh

RUN ls /tmp

COPY system_files /

#RUN ln -s /run /var/run

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh &&

RUN ls /usr/lib/modules

RUN rm -rf /var/log/*

RUN bootc container lint
