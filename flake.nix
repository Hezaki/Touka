{
  outputs =
    {
      flake-parts,
      home-manager,
      nixpkgs,
      nixpkgs-lock,
      nixpkgs-unstable,
      nixpkgs-master,
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
              pkgsLock = nixpkgs-lock.legacyPackages.x86_64-linux;
              pkgsUnstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
              pkgsMaster = nixpkgs-master.legacyPackages.x86_64-linux;
              inherit inputs;
            };
            modules = [
              ./hosts/think
            ];
          };
        };

        homeConfigurations = {
          hezaki = home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs-unstable.legacyPackages."x86_64-linux";
            extraSpecialArgs = {
              pkgsStable = nixpkgs.legacyPackages.x86_64-linux;
              pkgsMaster = nixpkgs-master.legacyPackages.x86_64-linux;
              inherit inputs;
            };
            modules = [
              ./home/hezaki
            ];
          };
        };

        homeConfigurations = {
          ktsrgi = home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs.legacyPackages."aarch64-linux";
            extraSpecialArgs = { inherit inputs; };
            modules = [
              ./home/ktsrgi
            ];
          };
        };

        nixosConfigurations = {
          hlcwlk = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
              ./hosts/hlcwlk
            ];
          };
        };

        homeConfigurations = {
          smtvna = home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
            extraSpecialArgs = { inherit inputs; };
            modules = [
              ./home/smtvna
            ];
          };
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-lock.url = "github:nixos/nixpkgs/862ecd674f4beced1fff1d5b91527b564eb41182";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nur.url = "github:nix-community/NUR";
    chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/*.tar.gz";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cursors = {
      url = "github:LilleAila/nix-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix/";
    ags.url = "github:aylur/ags";
    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };

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
