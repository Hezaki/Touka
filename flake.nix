{
  outputs =
    {
      flake-parts,
      home-manager,
      nixpkgs,
      nixpkgs-unstable,
      nixpkgs-master,
      nix-on-droid,
      hyprland,
      kernel,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      flake = {
        nixosConfigurations = {
          think = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = {
              kernel = kernel.legacyPackages.x86_64-linux;
              pkgsUnstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
              pkgsMaster = nixpkgs-master.legacyPackages.x86_64-linux;
              inherit inputs;
            };
            modules = [
              ./hosts/think
            ];
          };

          hlcwlk = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
              ./hosts/hlcwlk
            ];
          };
        };

        homeConfigurations = {
          hezaki = home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs-unstable.legacyPackages."x86_64-linux";
            extraSpecialArgs = {
              pkgsStable = nixpkgs.legacyPackages.x86_64-linux;
              pkgsMaster = nixpkgs-master.legacyPackages.x86_64-linux;
              hyprland = hyprland.legacyPackages.x86_64-linux;
              inherit inputs;
            };
            modules = [
              ./home/hezaki
            ];
          };

          smtvna = home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
            extraSpecialArgs = { inherit inputs; };
            modules = [
              ./home/smtvna
            ];
          };
        };

        nixOnDroidConfigurations = {
          ktsrgi = nix-on-droid.lib.nixOnDroidConfiguration {
            pkgs = import nixpkgs { system = "aarch64-linux"; };
            modules = [
              ./hosts/ktsrgi
            ];
          };
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nur.url = "github:nix-community/NUR";
    chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/*.tar.gz";

    kernel.url = "github:nixos/nixpkgs/862ecd674f4beced1fff1d5b91527b564eb41182";
    hyprland.url = "github:nixos/nixpkgs/6c7c078917d2e4b5c98d36102c90714b41ba82bb";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cursors = {
      url = "github:LilleAila/nix-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix/";
    ags.url = "github:aylur/ags";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

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

    tmux-tilish = {
      url = "github:farzadmf/tmux-tilish";
      flake = false;
    };

    tmux-sessionx = {
      url = "github:omerxx/tmux-sessionx";
      flake = false;
    };
  };
}
