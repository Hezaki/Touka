<p align="center">
  <img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nixos-white.png" width="500px" alt="NixOS logo"/>
</p>

## <p align="center">Hezaki Dotfiles</p>

![Screenshot](./1.png)
![Screenshot](./2.png)
![Screenshot](./3.png)

### Information
This is my Nix configuration, it contains NixOS, Nix-on-droid along with Home-manager. I am constantly updating the configuration, I love Nix very interesting. I used to sit on Artix Linux, then I got bored of sitting on it and I decided to try something new, and that's how I got acquainted with NixOS. It has a lot of advantages, for example, declarativeness and configuration can be run on almost any distribution, even on Alpine. It is very easy to make your own packages on it, it is convenient to build docker containers on it, you can safely roll back the system to your previous configuration, you can even separate the config of your entire system from users. You can have 10 users who will not contact each other in any way, their own packages for each user and their own settings. That is, you can easily make several different users, for study, for games, and so on. You will not have such a problem here that you forgot which packages you installed into the system, because everything is written in your own configuration. Also, configuration rollback can be combined with btrfs snapshots, it's very convenient! (Just so far it's not in my configuration, oops.). A huge repository, more than aur, you can still add additional repositories, like NUR, just seas of packages. Your configuration outside of nix can easily be made declarative using the home.file or xdg.file functions, not all programs support full nix configuration. The configuration can be done for multiple hosts, as did (nixos and nix-on-droid), it's very convenient! Also, in a sense, thanks to the rollback of configurations, your system is practically unkillable, so your system will be able to live on your PC for a long time. Update error? Not a problem, roll back. Wrong code so much that your grub is broken? Just change the code in livecd and rebuild in it without entering the chroot (only mount). I'm sure I don't know much about nix yet, so that's not all it has to offer, which is why I love nix so much. Read the documentation, look at other people's configurations, consult people and then you will be able to learn nix and write your own configuration, this is much better than completely taking someone else's))

Build host:
```bash
nixos-rebuild switch --flake .#hlcwlk      # or nixos-update
```

Build nix-on-droid:
```bash
nix-on-droid switch --flake .#ktsrgi       # or nix-update
```

Build home-manager:
```bash 
home-manager switch --flake .#hezaki       # or home-update
```

To make the home-manager work:
```bash 
doas chown -R hezaki:users /etc/nixos  
``` 

### Software
- **Wayland compositor** - [Hyprland](https://hyprland.org/)
- **Bar** - [Waybar](https://github.com/Alexays/Waybar)
- **Browser** - [Firefox](https://www.mozilla.org/)
- **Terminal** - [Foot](https://codeberg.org/dnkl/foot)
- **Editor** - [Neovim](https://neovim.io/)
- **Shell** - [Zsh](https://www.zsh.org/)
- **Notifications** - [Dunst](https://github.com/dunst-project/dunst)
- **Launcher** - [Rofi](https://github.com/lbonn/rofi)
- **Wallpaper** - `.github/wallpaper.png`

### Plans
1. - [x] Add a new host for ARM.
1. - [x] Update hyprland config.
1. - [ ] Install nix-colors. :)
1. - [ ] Make btrfs snapshots.
1. - [ ] Make btrfs snapshots.

### Thanks 
- [Thank you for your help <3](https://codeberg.org/ghosty)
- [Beautiful neovim configuration](https://github.com/Manas140/Conscious/tree/main)
