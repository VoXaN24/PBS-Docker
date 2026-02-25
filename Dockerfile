FROM debian:13

RUN apt update -y && apt upgrade -y
RUN apt install -y wget gnupg

RUN wget -O- https://download.proxmox.com/debian/proxmox-archive-keyring-trixie.gpg --no-check-certificate | gpg --dearmor -o /usr/share/keyrings/proxmox-archive-keyring.gpg7

RUN printf '%s\n' 'Types: deb' 'URIs: http://download.proxmox.com/debian/pbs/' 'Suites: trixie' 'Components: pbs-no-subscription' 'Signed-By: /usr/share/keyrings/proxmox-archive-keyring.gpg' | tee /etc/apt/sources.list.d/pbs-packages.list

RUN apt update -y && apt install -y proxmox-backup-server

EXPOSE 8007/tcp
EXPOSE 8007/udp

