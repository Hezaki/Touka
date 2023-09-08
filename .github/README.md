![Screenshot](./1.png)
![Screenshot](./2.png)
![Screenshot](./3.png)

## Information 
[<img src="https://nixos.org/logo/nixos-logo-only-hires.png" width="130" align="left" alt="NixOS">](https://nixos.org)

This is my Nix configuration, it contains NixOS, Nix-on-droid along with Home-manager.

#

Build host:
```bash
nixos-rebuild switch --flake .#hlcwlk   # or nixos-update
```



Build nix-on-droid:
```bash
nix-on-droid switch --flake .#ktsrgi    # or nix-update
```

Build home-manager:
```bash 
home-manager switch --flake .#hezaki    # or home-update
```

To make the home-manager work:
```bash 
doas chown -R hezaki:users /etc/nixos  
``` 

## Software
- **Wayland compositor** - [Hyprland](https://hyprland.org/)
- **Bar** - [Waybar](https://github.com/Alexays/Waybar)
- **Browser** - [Firefox](https://www.mozilla.org/)
- **Terminal** - [Foot](https://codeberg.org/dnkl/foot)
- **Editor** - [Neovim](https://neovim.io/)
- **Shell** - [Zsh](https://www.zsh.org/)
- **Notifications** - [Dunst](https://github.com/dunst-project/dunst)
- **Launcher** - [Rofi](https://github.com/lbonn/rofi)
- **Wallpaper** - `.github/wallpaper.png`

## Plans
- [ ] Create a script to run the config

## Thanks 
- [Thank you for your help <3](https://codeberg.org/ghosty)
- [Beautiful neovim configuration](https://github.com/Manas140/Conscious/tree/main)

