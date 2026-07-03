{
  outputs =
    {
      home-manager,
      nixpkgs,
      firefox-addons,
      ts3,
      ...
    }@inputs:

    {
      nixosConfigurations = {
        think = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/think ];
        };
      };

      homeConfigurations = {
        hezaki = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit inputs; };
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            overlays = [
              firefox-addons.overlays.default
              ts3.overlays.default
            ];
          };
          modules = [ ./home/hezaki ];
        };
      };

      systems = [ "x86_64-linux" ];
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/*.tar.gz";
    glide-browser.url = "github:glide-browser/glide.nix";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    ayugram-desktop.url = "github:ndfined-crp/ayugram-desktop/";
    dms-calendar.url = "github:AvengeMedia/dankcalendar";
    ts3.url = "github:Jokler/ts3client-noweb-nix";
    nixcord.url = "github:FlameFlag/nixcord";
    vimium-options.url = "github:uimataso/vimium-nixos";
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
    tg-ws-proxy.url = "github:pialtor/tg-ws-proxy-flake";
    niri.url = "github:sodiboo/niri-flake";
    niri-float-sticky.url = "github:probeldev/niri-float-sticky";
    stylix.url = "github:nix-community/stylix/release-26.05";
    plasma-manager.url = "github:nix-community/plasma-manager";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lsfg-vk-flake = {
      url = "github:pabloaul/lsfg-vk-flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "github:xddxdd/firefox-addons-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cursors = {
      url = "github:LilleAila/nix-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };

    powerlevel10k = {
      url = "github:romkatv/powerlevel10k";
      flake = false;
    };

    zsh-autosuggestions = {
      url = "github:zsh-users/zsh-autosuggestions";
      flake = false;
    };

    zsh-syntax-highlighting = {
      url = "github:zsh-users/zsh-syntax-highlighting";
      flake = false;
    };

    fzf-tab = {
      url = "github:Aloxaf/fzf-tab";
      flake = false;
    };

    fzf-zsh-completions = {
      url = "github:chitoku-k/fzf-zsh-completions";
      flake = false;
    };

    zsh-history-substring-search = {
      url = "github:zsh-users/zsh-history-substring-search";
      flake = false;
    };

    zsh-auto-notify = {
      url = "github:MichaelAquilina/zsh-auto-notify";
      flake = false;
    };

    zsh-autopair = {
      url = "github:hlissner/zsh-autopair";
      flake = false;
    };

    zsh-vi-mode = {
      url = "github:jeffreytse/zsh-vi-mode";
      flake = false;
    };

    tmux-smooth-scroll = {
      url = "github:azorng/tmux-smooth-scroll";
      flake = false;
    };

    tmux-tilish = {
      url = "github:farzadmf/tmux-tilish";
      flake = false;
    };

    betterfox = {
      url = "github:yokoffing/Betterfox";
      flake = false;
    };

    parfait = {
      url = "github:reizumii/parfait";
      flake = false;
    };

    ghostty-cursor-shaders = {
      url = "github:sahaj-b/ghostty-cursor-shaders";
      flake = false;
    };
  };
}
