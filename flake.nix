{
  outputs = { self, flake-parts, home-manager, nix-on-droid, ... } @ inputs: 
  flake-parts.lib.mkFlake { inherit inputs; } { 
    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];

    flake = {
      overlays = import ./overall/overlays { inherit inputs; };

      nixosConfigurations = {
        hlcwlk = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/hlcwlk
          ];
        };
      };

      homeConfigurations = {
        hezaki = home-manager.lib.homeManagerConfiguration {
          pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./home/hezaki
          ];
        };
      };

      nixOnDroidConfigurations = {
        ktsrgi = nix-on-droid.lib.nixOnDroidConfiguration {
          modules = [
            ./hosts/ktsrgi
          ];
        };
      };      
    };

    perSystem = { config, inputs', pkgs, system, nixvim, ... }: {
      imports = [
        {
          _module.args.pkgs = import inputs.nixpkgs {
            config.allowUnfree = true;
            config.allowUnsupportedSystem = true;
            inherit system;
          };
        }
      ];
    };
  };

  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nur.url = "github:nix-community/NUR";

    hyprland = {
      url = "github:hyprwm/Hyprland/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypr-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpicker.url = "github:hyprwm/hyprpicker";
    xdph = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:pta2002/nixvim";

    nix-gaming = {
      url = "github:fufexan/nix-gaming/d10b39b3e525907d904854b86803cf4b102daed9";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:t184256/nix-on-droid/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };
}
