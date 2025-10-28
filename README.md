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

## 💻Hardware
- Laptop — [Lenovo ThinkPad T14 gen 1](https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/t14-amd-g1/22tpt14t4a2)
	- An excellent office laptop, there is a profile in [nixos-hardware](https://github.com/NixOS/nixos-hardware/blob/master/lenovo/thinkpad/t14/amd/gen1)
- Mouse — [Logitech G304](https://www.logitechg.com/en-ph/products/gaming-mice/g304-lightspeed-wireless-gaming-mouse.910-005284.html)
	- Wireless mouse, works great with Linux, [libratbag](https://github.com/libratbag/libratbag) supports it 

## 📚Layout
- [flake.nix](flake.nix) main configuration file
- [home](home) home-manager configuration
	- [hezaki](home/hezaki) main user Home-Manager configuration
		- [default.nix](home/hezaki/default.nix) main Home-Manager user configuration file
		- [programs](home/hezaki/programs) all user program configurations
			- [default.nix](home/hezaki/programs/default.nix) imports all program categories
			- [desktop](home/hezaki/programs/desktop) desktop environment configurations
				- [default.nix](home/hezaki/programs/desktop/default.nix) imports all desktop environment configurations
				- [ags](home/hezaki/programs/desktop/ags) AGS (Awesome Gtk Shell) configuration
				- [anyrun](https://github.com/Kirovez/anyrun) app runner configuration
				- [fusuma](https://github.com/iberianpig/fusuma) custom gestures touchpad configuration
				- [cliphist](https://github.com/sentriz/cliphist) clipboard history configuration
				- [hyprland](https://hyprland.org/) wayland compositor configuration
					- [autostart](home/hezaki/programs/desktop/hyprland/autostart.nix) Hyprland autostart commands
					- [binds](home/hezaki/programs/desktop/hyprland/binds.nix) Hyprland keybindings
					- [plugins](home/hezaki/programs/desktop/hyprland/plugins.nix) Hyprland plugins
					- [scripts](home/hezaki/programs/desktop/hyprland/scripts.nix) Hyprland scripts (screenshots, window rules)
				- [niri](https://github.com/YaLTeR/niri) wayland compositor configuration
				- [hyprlock](https://github.com/hyprwm/hyprlock) screenlocker configuration
				- [nwg-dock](home/hezaki/programs/desktop/nwg-dock) `nwg-dock-hyprland` configuration
				- [portals](https://flatpak.github.io/xdg-desktop-portal/) XDG Desktop Portal and user directories configuration
				- [swayimg](https://github.com/artemsen/swayimg) image viewer configuration
				- [swaync](https://github.com/ErikReider/SwayNotificationCenter) notification center configuration
				- [waybar](https://github.com/Alexays/Waybar) status bar configuration
				- [udiskie](https://github.com/coldfix/udiskie) automounting configuration
			- [devlop](home/hezaki/programs/devlop) developer utilities and language servers
			- [graphical](home/hezaki/programs/graphical) graphical programs configurations
				- [default.nix](home/hezaki/programs/graphical/default.nix) imports all graphical program configurations
				- [blockbench](https://www.blockbench.net/) low-poly 3D model editor configuration
				- [browsers](home/hezaki/programs/graphical/browsers) browser configurations
					- [default.nix](home/hezaki/programs/graphical/browsers/default.nix) imports all browser configurations
					- [firefox](https://www.mozilla.org/firefox/) Firefox browser configuration
					- [chromium](https://www.chromium.org/) Chromium browser configuration
				- [easyeffects](home/hezaki/programs/graphical/easyeffects) EasyEffects audio processing configuration
				- [foot](https://codeberg.org/dnkl/foot) terminal emulator configuration
				- [games](home/hezaki/programs/graphical/games) games configurations
					- [default.nix](home/hezaki/programs/graphical/games/default.nix) imports all game configurations
					- [terraria](https://terraria.org/) Terraria game configuration
				- [kitty](https://sw.kovidgoyal.net/kitty/) terminal emulator configuration
				- [mangohud](https://github.com/flightlessmango/MangoHud) (pearhud) overlay monitoring FPS configuration
				- [mpv](https://mpv.io/) media player configuration
				- [obs-studio](https://obsproject.com/) video recording/streaming configuration
				- [obsidian](https://obsidian.md/) note-taking app theme configuration
				- [prismlauncher](https://prismlauncher.org/) Minecraft launcher configuration
				- [telegram](https://telegram.org/) (AyuGram Desktop) client configuration
				- [vesktop](https://github.com/Vencord/Vesktop) Discord client configuration
				- [zathura](https://pwmt.org/projects/zathura/) PDF reader configuration
				- [kdeconnect](https://kdeconnect.kde.org/) sync with phone service configuration
			- [terminal](home/hezaki/programs/terminal) terminal utilities configurations
				- [default.nix](home/hezaki/programs/terminal/default.nix) imports all terminal utility configurations
				- [anicliru](home/hezaki/programs/terminal/anicliru) `ani-cli-ru` related Python package definitions
					- [anicli-api](home/hezaki/programs/terminal/anicliru/anicli-api.nix) `anicli-api` Python package definition
					- [anicli-ru](home/hezaki/programs/terminal/anicliru/anicli-ru.nix) `ani-cli-ru` Python package definition
					- [chompjs](home/hezaki/programs/terminal/anicliru/chompjs.nix) `chompjs` Python package definition
				- [bat](https://github.com/sharkdp/bat) (cat clone with syntax highlighting) configuration
				- [btop](https://github.com/aristocratos/btop) (resource monitor) configuration
				- [cava](https://github.com/karlstav/cava) audio visualizer configuration
				- [editors](home/hezaki/programs/terminal/editors) text editor configurations
					- [default.nix](home/hezaki/programs/terminal/editors/default.nix) imports all terminal editor configurations
					- [emacs](https://www.gnu.org/software/emacs/) Emacs text editor configuration
					- [neovim](https://neovim.io/) Neovim text editor configuration
				- [espanso](https://espanso.org/) text expander configuration
				- [fastfetch](https://github.com/fastfetch-cli/fastfetch) system information tool configuration
				- [fd](https://github.com/sharkdp/fd) (fast `find` alternative) configuration
				- [fzf](https://github.com/junegunn/fzf) fuzzy finder configuration
				- [git](https://git-scm.com/) Git configuration
				- [lazygit](https://github.com/jesseduffield/lazygit) TUI for Git
				- [lsd](https://github.com/lsd-rs/lsd) (modern `ls` replacement) configuration
				- [pandoc](https://pandoc.org/) universal markup converter configuration
				- [ripgrep](https://github.com/BurntSushi/ripgrep) (fast `grep` alternative) configuration
				- [shell](home/hezaki/programs/terminal/shell) shell configuration
					- [default.nix](home/hezaki/programs/terminal/shell/default.nix) imports Zsh and translate-shell configurations
					- [translate-shell](https://github.com/soimort/translate-shell) terminal translator configuration
					- [zsh](https://www.zsh.org/) Zsh shell configuration
				- [tmux](https://github.com/tmux/tmux/wiki) terminal multiplexer configuration
				- [yazi](https://github.com/sxycode/yazi) terminal file manager configuration
				- [yt-dlp](https://github.com/yt-dlp/yt-dlp) (video downloader) configuration
				- [zoxide](https://github.com/ajeetdsouza/zoxide) (smarter `cd` command) configuration
		- [themes](home/hezaki/themes) Stylix theme configuration
			- [default.nix](home/hezaki/themes/default.nix) main Stylix theme configuration file
			- [images](home/hezaki/themes/images) wallpapers!
- [hosts](hosts) host-specific configurations
	- [think](hosts/think) main NixOS configuration for the ThinkPad
		- [default.nix](hosts/think/default.nix) main NixOS configuration file for the ThinkPad
		- [enviroment](hosts/think/enviroment) host environment configurations
			- [default.nix](hosts/think/enviroment/default.nix) imports all host environment categories
			- [fonts](hosts/think/enviroment/fonts) system-wide font settings
			- [home-manager](hosts/think/enviroment/home-manager) Home-Manager basic configuration
			- [local](hosts/think/enviroment/local) locale and timezone settings
			- [network](hosts/think/enviroment/network) network configuration (NetworkManager, firewall)
			- [nix](hosts/think/enviroment/nix) Nix daemon settings and flake configuration
			- [programs](hosts/think/enviroment/programs) host-level program configurations
			    - [clamav](https://www.clamav.net/) antivirus configuration
			    - [flatpak](https://flatpak.org/) Flatpak service and package configuration
				- [k3s](https://k3s.io/) K3s (lightweight Kubernetes) service configuration
				- [kanata](https://github.com/jtroo/kanata) keyboard remapper configuration
				- [nh](https://github.com/viperML/nh) yet another nix cli helper configuration
				- [nix-ld](https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/nix-ld/README.md) `nix-ld` configuration for running non-Nix binaries
				- [openvpn](https://openvpn.net/) OpenVPN3 client configuration
                - [polkit](https://www.freedesktop.org/software/polkit/docs/latest/) Polkit authentication agent configuration
                - [podman](https://podman.io/) Podman (rootless container engine) configuration
                - [steam](https://store.steampowered.com/) Steam client configuration
				- [solaar](https://pwr-solaar.github.io/solaar/) Solaar configuration for Logitech devices
				- [gpu-screen-recorder](https://github.com/Decodetalkers/gpu-screen-recorder) GPU Screen Recorder configuration
				- [hamachi](https://vpn.net/) LogMeIn Hamachi VPN client configuration
				- [zapret](https://github.com/bol-shoy/zapret) Zapret bypass tool configuration
			- [security](hosts/think/enviroment/security) system security settings (sudo-rs, polkit)
			- [users](hosts/think/enviroment/users) system user and group definitions
			- [variables](hosts/think/enviroment/variables) environment variables
		- [filesystem](hosts/think/filesystem) filesystem and ZRAM swap configuration
		- [hardware](hosts/think/hardware) hardware settings
			- [default.nix](hosts/think/hardware/default.nix) imports all hardware settings categories
			- [battery](hosts/think/hardware/battery) battery management services
			- [graphic](hosts/think/hardware/graphic) graphics hardware settings (AMDGPU, VAAPI)
			- [periphery](hosts/think/hardware/periphery) periphery hardware settings (Bluetooth, Pipewire)
			- [tweaks](hosts/think/hardware/tweaks) system performance tweaks
		- [systemd](hosts/think/systemd) Systemd service configurations

Why Touka? I'm just a big fan of [Touka Kirishima](https://tokyoghoul.fandom.com/wiki/Touka_Kirishima)  from TK)))

 ## ❤️ Thanks 
- [Thank you for your help <3](https://codeberg.org/ghosty)
- [Beautiful neovim configuration](https://github.com/Manas140/Conscious/tree/main)
