{ config, pkgs, ... }:

{ 
  networking = {
    hostName = "hlcwlk";
    networkmanager = {
      enable = true;
      insertNameservers = [ "1.1.1.1" "1.0.0.1" ];
    };
    dhcpcd = {
      wait = "background";
      extraConfig = "noarp";
    };
  };
  
  systemd = {
    targets.network-online.wantedBy = pkgs.lib.mkForce [];
    services = {
      NetworkManager-wait-online.wantedBy = pkgs.lib.mkForce []; # Normally ["network-online.target"]
      NetworkManager-wait-online.enable = false;
      systemd-udev-settle.enable = false;
    };
  };

}
