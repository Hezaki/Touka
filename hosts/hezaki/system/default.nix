{ config, pkgs, ... }:

{
  # Import core modules
  imports = [
    ./bootloader.nix
    ./network.nix
    ./systemd.nix
    ./enviroment.nix
  ];
  
  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "23.05";
}
