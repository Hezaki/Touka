{ pkgs, ... }:
{
  systemd = {
    targets.network-online.wantedBy = pkgs.lib.mkForce [ ];
  };
  services = {
    resolved.enable = true;
    journald = {
      extraConfig = "SystemMaxUse=50M\nSystemMaxFiles=5";
      rateLimitBurst = 500;
      rateLimitInterval = "30s";
    };
  };
}
