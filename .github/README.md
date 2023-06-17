<p align="center">
  <img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nixos-white.png" width="500px" alt="NixOS logo"/>
</p>

## <p align="center">Hezaki Dotfiles</p>

![Screenshot](.github/1.png)
![Screenshot](.github/2.png)
![Screenshot](.github/3.png)

### Infomation
> This is my NixOS configuration, it is divided into nixosConfiguration and homeConfiguration, you can build them separately.
> #
> Build host:
>> ```nixos-rebuild switch --flake .#hlcwlk```
> #
> But you can use aliases
>> ```nixos-update```
> #
> Build home-manager:
>> ```home-manager switch --flake .#hezaki```
> #
> And similarly:
>> ```home-update```
> #
> To make the home-manager work:
>> ```su root -c chown -R hezaki:users /etc/nixos/``` 

### Software
> - **Wayland compositor** - [Hyprland](https://hyprland.org/)
> - **Bar** - [Waybar](https://github.com/Alexays/Waybar)
> - **Browser** - [Firefox](https://www.mozilla.org/)
> - **Terminal** - [Foot](https://codeberg.org/dnkl/foot)
> - **Editor** - [Neovim](https://neovim.io/)
> - **Shell** - [Zsh](https://www.zsh.org/)
> - **Notifications** - [Dunst](https://github.com/dunst-project/dunst))
> - **Launcher** - [Rofi](https://github.com/lbonn/rofi)
> - **Wallpaper** - `.github/wallpaper.png`

### Plans
> - [ ] Add a new host for ARM.
> - [ ] Add local packages.
> - [ ] Update hyprland config.

### Thanks 
> - [Beautiful neovim configuration](https://github.com/Manas140/Conscious/tree/main)
> - [Thank you for your help](https://codeberg.org/ghosty)
kkk
