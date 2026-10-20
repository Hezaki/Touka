{
  outputs =
    inputs@{
      home-manager,
      nixpkgs,
      firefox-addons,
      ts3,
      flake-parts,
      ...
    }:

    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
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
      };

      perSystem = { system, ... }: {
        _module.args.pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      };

      systems = [ "x86_64-linux" ];
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/*.tar.gz";
    stylix.url = "github:nix-community/stylix/release-26.05";
    ts3.url = "github:Jokler/ts3client-noweb-nix";
    nixcord.url = "github:4evy/nixcord";
    vimium-options.url = "github:uimataso/vimium-nixos";
    niri.url = "github:epireyn/niri-flake";
    niri-keybind.url = "github:JustinSpedding/niri/up-down-keybinds";
    proxy-suite.url = "github:FUFSoB/proxy-suite-flake";
    bluevein.url = "github:meowrch/BlueVein";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    helium-browser = {
      url = "github:oxcl/nix-flake-helium-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "github:petrkozorezov/firefox-addons-nix";
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

    tmux-tilish = {
      url = "github:farzadmf/tmux-tilish";
      flake = false;
    };
  };
}
