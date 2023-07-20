{ config, ... }: {
  imports = [
    ./tools/pipewire.nix
    ./tools/variables.nix
    ./tools/hardware.nix

    ./system/network.nix
    ./system/systemd.nix
    ./system/bootloader.nix
    ./system/enviroment.nix
    ./system/nixconf.nix

    ./hardware-configuration.nix
  ];

  system.stateVersion = "23.05";
}
