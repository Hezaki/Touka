{
  description = "Hezaki configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nurpkgs.url = "github:nix-community/NUR";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    hyprland.url = "github:hyprwm/Hyprland/";
    hyprland-contrib.url = "github:hyprwm/contrib";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:t184256/nix-on-droid/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self, home-manager, nix-on-droid, ...
  } @ inputs: let
    inherit (self) outputs;
    hostname = "hlcwlk";
    username = "hezaki";
    pkgs = inputs.nixpkgs;
  in {
    nixosConfigurations = {
      ${hostname} = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        system = "x86_64-linux";
        modules = [ 
          ./hosts/hezaki
        ];
      };
    };

    homeConfigurations = {
      ${username} = home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          ./home/hezaki
        ];
      };
    };

    nixOnDroidConfigurations = { 
      mistao = nix-on-droid.lib.nixOnDroidConfiguration {
      system = "aarch64-linux";
        modules = [
          ./hosts/mistao
        ];
      };
    };
  };
}
