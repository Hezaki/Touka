<h1 align="center">Touka</h1>
<p align="center">This is my nonfemboy Nix configuration</p>
<img src="./.other/1.png" alt="kakoi lubopitniy ai ai ai">

## ℹ️Information
I recommend using  [nh](https://github.com/viperML/nh), if you don't have it then:
``` bash
nix shell nixpkgs#nh
```

Build host:
``` bash
nh os switch . -a                         # or nixos-rebuild switch --flake .#think
```

Build home-manager on desktop:
``` bash
nh home switch . -a                       # or home-manager switch --flake .#hezaki
```
To make the home-manager work:

``` bash
doas chown -R hezaki:users /etc/nixos     # if you use this path
```

Why Touka? I'm just a big fan of [Touka Kirishima](https://tokyoghoul.fandom.com/wiki/Touka_Kirishima)  from TK)))

## 💻Hardware
- Laptop — [Lenovo ThinkPad T14 gen 1](https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/t14-amd-g1/22tpt14t4a2)
	- An excellent office laptop, there is a profile in [nixos-hardware](https://github.com/NixOS/nixos-hardware/blob/master/lenovo/thinkpad/t14/amd/gen1)
- Mouse — [Logitech G304](https://www.logitechg.com/en-ph/products/gaming-mice/g304-lightspeed-wireless-gaming-mouse.910-005284.html)
	- Wireless mouse, works great with Linux, [libratbag](https://github.com/libratbag/libratbag) supports it 

## 📚Layout
- [flake.nix](flake.nix) main configuration file
- [home](home) home-manager configuration
	- [hezaki](home/hezaki) main user configuration
		- [programs](home/hezaki/programs) there are all programs for this user
			- [desktop](home/hezaki/programs/desktop) everything that is responsible for the environment
				- [anyrun](home/hezaki/programs/desktop/anyrun) app runner
				- [fusuma](home/hezaki/programs/desktop/fusuma) custom gestures touchpad
				- [cliphist](home/hezaki/programs/desktop/cliphist) clipboard history
				- [hyprland](home/hezaki/programs/desktop/hyprland) wayland compositor
				- [hyprlock](home/hezaki/programs/desktop/hyprlock) screenlocker
				- [portals](home/hezaki/programs/desktop/portals) config xdg
				- [swayimg](home/hezaki/programs/desktop/swayimg) best image viewer
				- [swaync](home/hezaki/programs/desktop/swaync) notification
				- [waybar](home/hezaki/programs/desktop/waybar) bar
				- [udiskie](home/hezaki/programs/desktop/udiskie) automount
			- [devlop](home/hezaki/programs/devlop) developer utils
			- [graphical](home/hezaki/programs/graphical) gui programs
				- [blockbench](home/hezaki/programs/graphical/blockbench) low-poly 3D model editor
				- [browsers](home/hezaki/programs/graphical/browsers) blowsers
					- [firefox](home/hezaki/programs/graphical/browsers/firefox) the best browser that has created humanity, I hate it
					- [chromium](home/hezaki/programs/graphical/browsers/chromium) cummimum
				- [foot](home/hezaki/programs/graphical/foot) terminal!
				- [games](home/hezaki/programs/graphical/games) ИГРЫ БЛЯТЬ, ИГРЫ
					- [terraria](home/hezaki/programs/graphical/games/terraria) i like
				- [kitty](home/hezaki/programs/graphical/kitty) terminal!!
				- [mangohud](home/hezaki/programs/graphical/mangohud) (pearhud) overlay monitoring FPS
				- [mpv](home/hezaki/programs/graphical/mpv) best media player
				- [obs-studio](home/hezaki/programs/graphical/obs-studio) video recorder and more
				- [obsidian](home/hezaki/programs/graphical/obsidian) only 10 pieces
				- [prismlauncher](home/hezaki/programs/graphical/prismlauncher) best minecraft launcher
				- [telegram](home/hezaki/programs/graphical/telegram) messenger!
				- [vesktop](home/hezaki/programs/graphical/vesktop) best discord client
				- [zathura](home/hezaki/programs/graphical/zathura) pdf-reader! I can't live without him
				- [kdeconnect](home/hezaki/programs/graphical/kdeconnect) sync with phone
			- [termianl](home/hezaki/programs/terminal) terminal utils
				- [anicliru](home/hezaki/programs/terminal/anicli) some kind of Russian shit
				- [bat](home/hezaki/programs/terminal/bat) alt cat
				- [btop](home/hezaki/programs/terminal/btop) a monitor of resources 
				- [cava](home/hezaki/programs/terminal/cava) avac
				- [editors](home/hezaki/programs/terminal/editors) how without it
					- [emacs](home/hezaki/programs/terminal/editors/emacs)  editor for pussyboy
					- [neovim](home/hezaki/programs/terminal/editors/neovim) the best text editor
				- [espanso](home/hezaki/programs/terminal/espanso) text expander
				- [fastfetch](home/hezaki/programs/terminal/fastfetch) fetch like neofetch
				- [fd](home/hezaki/programs/terminal/fd) alt find on rust
				- [fzf](home/hezaki/programs/terminal/fzf) fuzzy finder!
				- [git](home/hezaki/programs/terminal/git) config for git
				- [lazygit](home/hezaki/programs/terminal/lazygit) for very lazy
				- [lsd](home/hezaki/programs/terminal/lsd) alt ls on rust
				- [pandoc](home/hezaki/programs/terminal/pandoc) universal markup converter 
				- [ripgrep](home/hezaki/programs/terminal/ripgrep) alt grep on rust
				- [shell](home/hezaki/programs/terminal/shell) shell!!!
					- [translate-shell](home/hezaki/programs/terminal/shell/translate-shell) terminal translator
					- [zsh](home/hezaki/programs/terminal/shell/zsh) best shell
				- [tmux](home/hezaki/programs/terminal/tmux) terminal multiplexer
				- [yazi](home/hezaki/programs/terminal/yazi) terminal file manager
				- [yt-dlp](home/hezaki/programs/terminal/yt-dlp) to download any shit
				- [zoxide](home/hezaki/programs/terminal/zoxide) smarter sd command
		- [themes](home/hezaki/themes) stylix configuration
			- [images](home/hezaki/themes/images) wallpapers!
- [hosts](hosts) maybe configuration for hosts?
	- [think](hosts/think) config for my thinkpad
		- [enviroment](hosts/think/enviroment) all the most necessary, lol
			- [fonts](hosts/think/enviroment) where without them
			- [home-manager](hosts/think/enviroment/home-manager) basic config home-manager itself
			- [local](hosts/think/enviroment/local) locale-gen
			- [network](hosts/think/enviroment/) setting network
			- [nix](hosts/think/enviroment/) setting nix
			- [programs](hosts/think/enviroment/programs) utils on host
			    - [clamav](hosts/think/enviroment/programs/clamav) antivirus
			    - [flatpak](hosts/think/enviroment/programs/flatpak) declarative flatpak
				- [k3s](hosts/think/enviroment/programs/k3s) kubernetes
				- [kanata](hosts/think/enviroment/programs/kanata) keyboard remapper
				- [nh](hosts/think/enviroment/programs/nh) yet another nix cli helper
				- [nix-ld](hosts/think/enviroment/programs/nix-ld) run bin
				- [openvpn](hosts/think/enviroment/programs/openvpn) ovpn
                - [polkit](hosts/think/enviroment/programs/polkit) polkit setting
                - [podman](hosts/think/enviroment/programs/podman) rootless docker containers
                - [steam](hosts/think/enviroment/programs/polkit) steam client
		- [filesystem](hosts/think/filesystem) file system configuration!
		- [hardware](hosts/think/hardware) hardware settings for my thinkpad
			- [battery](hosts/think/hardware/battery) battery setting
			- [graphic](hosts/think/hardware/graphic) responsible for graphics
			- [periphery](hosts/think/hardware/periphery) setting up my periphery
			- [tweaks](hosts/think/hardware/tweaks) all sorts of tweaks for "optimization"
		- [systemd](hosts/think/systemd) OH NO

 ## ❤️ Thanks 
- [Thank you for your help <3](https://codeberg.org/ghosty)
- [Beautiful neovim configuration](https://github.com/Manas140/Conscious/tree/main)
