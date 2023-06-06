{
  description = "Hezaki configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nurpkgs.url = "github:nix-community/NUR";
    hyprland.url = "github:hyprwm/Hyprland/";
    hyprland-contrib.url = "github:hyprwm/contrib";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    chaotic,
    home-manager,
    ...
  } @ inputs: let
    hostname = "hlcwlk";
    username = "hezaki";
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs;
  in {
    nixosConfigurations = {
      ${hostname} = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ 
          { networking.hostName = "${hostname}"; }
          chaotic.nixosModules.default
          ./hosts/hezaki/hardware-configuration.nix
          ./hosts/hezaki/tools/default.nix
          ./hosts/hezaki/system/default.nix
          ./hosts/hezaki/home.nix
        ];
      };
    };
    # homeConfigurations = {
    #   ${username} = home-manager.lib.homeManagerConfiguration {
    #     extraSpecialArgs = { inherit inputs; };
    #     modules = [
    #       ./hosts/hezaki/home.nix
    #     ];
    #   };
    # };
  };
}
