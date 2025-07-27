{
  outputs =
    {
      home-manager,
      nixpkgs,
      nixpkgs-stable,
      ...
    }@inputs:
    let
      agrs = {
        pkgsStable = nixpkgs-stable.legacyPackages.x86_64-linux;
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
          modules = [
            ./hosts/think
          ];
        };
      };

      homeConfigurations = {
        hezaki = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          extraSpecialArgs = agrs;
          modules = [
            ./home/hezaki
          ];
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nur.url = "github:nix-community/NUR";
    chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/*.tar.gz";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cursors = {
      url = "github:LilleAila/nix-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix/master";
    hyprsplit.url = "github:shezdy/hyprsplit";

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun = {
      url = "github:Kirottu/anyrun";
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

    tmux-sessionx = {
      url = "github:omerxx/tmux-sessionx";
      flake = false;
    };

    tmux-fzf = {
      url = "github:sainnhe/tmux-fzf";
      flake = false;
    };
  };
}
