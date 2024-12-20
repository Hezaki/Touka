<h1 align="center">Touka</h1>
<p align="center">This is my nonfemboy Nix configuration, for desktop and a small configuration for android</p>
<img src="./.other/1.png" alt="kakoi lubopitniy ai ai ai">

# Information
I recommend using  [nh](https://github.com/viperML/nh), if you don't have it then:
``` nix
nix shell nixpkgs#nh
```
Build host:
```nix
nh os switch . -a                         # or nixos-rebuild switch --flake .#think
```
Build home-manager on desktop:
```nix
nh home switch . -a                       # or home-manager switch --flake .#hezaki
```
To make the home-manager work:
```shell
doas chown -R hezaki:users /etc/nixos     # if you use this path
```
Why Touka? I'm just a big fan of [Touka Kirishima](https://tokyoghoul.fandom.com/wiki/Touka_Kirishima)  from TK)))
## 💻Hardware
- Laptop — [Lenovo ThinkPad T14 gen 1](https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/t14-amd-g1/22tpt14t4a2)
	- An excellent office laptop, there is a profile in [nixos-hardware](https://github.com/NixOS/nixos-hardware/blob/master/lenovo/thinkpad/t14/amd/gen1)
- Mouse — [Logitech G304](https://www.logitechg.com/en-ph/products/gaming-mice/g304-lightspeed-wireless-gaming-mouse.910-005284.html)
	- Wireless mouse, works great with Linux, [libratbag](https://github.com/libratbag/libratbag) supports it 
## ⚙️ Software
   - Wayland compositor — [Hyprland](https://hyprland.org)
   - Bar — [Waybar](https://github.com/Alexays/Waybar)
   - Browser — [Firefox](https://www.mozilla.org)
   - Terminal — 
   - Editor — [Neovim](https://neovim.io)
   - Shell —  [Zsh](https://www.zsh.org/)
   - Notifications — [SwayNotificationCenter](https://github.com/ErikReider/SwayNotificationCenter)
   - Launcher —  [Anyrun](https://github.com/Kirottu/anyrun)
   - Wallpaper — [``home/hezaki/themes/images/``](https://codeberg.org/Hezaki/Touka/src/branch/main/home/hezaki/themes/images)
 ## ❤️ Thanks 
- [Thank you for your help <3](https://codeberg.org/ghosty)
- [Beautiful neovim configuration](https://github.com/Manas140/Conscious/tree/main)
