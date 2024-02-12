{ pkgs, ... }: {
  systemd = {
    targets.network-online.wantedBy = pkgs.lib.mkForce [];
    services = {
      NetworkManager-wait-online.wantedBy = pkgs.lib.mkForce []; 
      NetworkManager-wait-online.enable = false;
      systemd-udev-settle.enable = false;
    };
  };

  services = {
    espanso.enable = true;
    flatpak.enable = true;
    udev.packages = with pkgs; [
      android-udev-rules
    ];
  };
}
