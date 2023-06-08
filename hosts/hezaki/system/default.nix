{ config, pkgs, ... }:

{
  imports = [
    ./bootloader.nix
    ./network.nix
    ./systemd.nix
    ./enviroment.nix
  ];

  system.stateVersion = "23.05";
}
