{ config, ... }: {
  imports = [
    ./tools/pipewire.nix
    ./tools/variables.nix

    ./system/network.nix
    ./system/systemd.nix
    ./system/bootloader.nix
    ./system/enviroment.nix
    ./system/hardware.nix

    ./hardware-configuration.nix
  ];

  system.stateVersion = "23.05";
}
