{
  outputs =
    {
      home-manager,
      nixpkgs,
      nixpkgs-unstable,
      firefox-addons,
      ...
    }@inputs:
    let
      agrs = {
        pkgsUnstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
        inherit inputs;
      };
    in
    {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      nixosConfigurations = {
        think = nixpkgs.lib.nixosSystem {
          specialArgs = agrs;
          modules = [ ./hosts/think ];
        };
      };

      homeConfigurations = {
        hezaki = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            overlays = [ firefox-addons.overlays.default ];
          };
          extraSpecialArgs = agrs;
          modules = [ ./home/hezaki ];
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nur.url = "github:nix-community/NUR";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    jovian-steamdeck = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord.url = "github:FlameFlag/nixcord";

    lsfg-vk-flake = {
      url = "github:pabloaul/lsfg-vk-flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    betterfox = {
      url = "github:yokoffing/Betterfox";
      flake = false;
    };

    firefox-addons = {
      url = "github:petrkozorezov/firefox-addons-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vimium-options.url = "github:uimataso/vimium-nixos";

    lunar-client.url = "github:clonidine/lunar-client-flake";

    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
    zapret2.url = "github:dmfrpro/zapret2-flake";
    tg-ws-proxy.url = "github:pialtor/tg-ws-proxy-flake";

    niri.url = "github:sodiboo/niri-flake";
    system76-scheduler-niri.url = "github:Kirottu/system76-scheduler-niri";
    niri-float-sticky.url = "github:probeldev/niri-float-sticky";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cursors = {
      url = "github:LilleAila/nix-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix/release-25.11";

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

    tmux-tilish = {
      url = "github:farzadmf/tmux-tilish";
      flake = false;
    };

    tmux-continuum = {
      url = "github:tmux-plugins/tmux-continuum";
      flake = false;
    };
  };
}
