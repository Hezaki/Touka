{ config, pkgs, ... }: {
  systemd = {
    targets.network-online.wantedBy = pkgs.lib.mkForce [];
    services = {
      NetworkManager-wait-online.wantedBy = pkgs.lib.mkForce []; 
      NetworkManager-wait-online.enable = false;
      systemd-udev-settle.enable = false;
    };
  };
  services.udev.packages = with pkgs; [
    android-udev-rules
  ];
}
