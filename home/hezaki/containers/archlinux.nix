{ pkgs, ... }: {
  home.packages = with pkgs; [ ansible ];
  xdg.configFile."ansible/archlinux.yml".text = ''
---
- name: ArchLinux
  hosts: 127.0.0.1
  become: true

  tasks:
    - name: genericKeys
      shell: pacman-key --init

    - name: installChaoticAur
      shell: pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com

    - name: step 2
      shell: pacman-key --lsign-key 3056513887B78AEB

    - name: step 3 
      pacman:
        name: https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst
        state: present

    - name: step 4
      pacman: 
        name: https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst
        state: present

    - name: installGit
      pacman:
        name: git 
        state: present

    - name: cloneArchd
      git:
        repo: https://codeberg.org/hezaki/archd
        dest: /home/hezaki/Repositories/archd
        force: yes

    - name: step 2
      shell: mv /home/hezaki/Repositories/archd/pacman.conf /etc/

    - name: updateAll
      pacman:
        update_cache: true
        upgrade: true

    - name: installBase
      pacman:
        name: base-devel
        state: present

    - name: installParu
      pacman:
        name: paru
        state: present

    - name: installWine
      pacman: 
        name: wine-ge-custom
        state: present
  '';
}
