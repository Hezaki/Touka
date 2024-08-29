{ pkgs, ... }:
{
  systemd = {
    targets.network-online.wantedBy = pkgs.lib.mkForce [];
    services = {
      NetworkManager-wait-online.wantedBy = pkgs.lib.mkForce []; 
      NetworkManager-wait-online.enable = false;
      systemd-udev-settle.enable = false;
    };
  };
  services.journald = {
    extraConfig = "SystemMaxUse=50M\nSystemMaxFiles=5";
    rateLimitBurst = 500;
    rateLimitInterval = "30s";
  };
}
