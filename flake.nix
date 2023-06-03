{
  description = "Hezaki configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nurpkgs.url = "github:nix-community/NUR";
    hyprland.url = "github:hyprwm/Hyprland/";
    hyprland-contrib.url = "github:hyprwm/contrib";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    neovim-flake.url = "github:jordanisaacs/neovim-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, chaotic, ...} @ inputs:
  let
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
  in {
    nixosConfigurations.hlcwlk = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [ 
        { networking.hostName = "hlcwlk"; }
        chaotic.nixosModules.default
        ./hosts/hezaki/hardware-configuration.nix
        ./hosts/hezaki/tools/default.nix
        ./hosts/hezaki/system/default.nix
        ./hosts/hezaki/home.nix
        ./virtualization/containers.nix
      ];
    };
  };
}
