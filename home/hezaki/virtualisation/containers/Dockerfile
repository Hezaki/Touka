FROM archlinux:latest

RUN pacman -Syu --noconfirm git
RUN pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
RUN pacman-key --lsign-key 3056513887B78AEB
RUN pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
RUN git clone https://codeberg.org/hezaki/archd.git
RUN cp -r archd/pacman.conf /etc
RUN pacman -Syu --noconfirm neofetch neovim
