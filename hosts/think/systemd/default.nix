{ pkgs, ... }:
{
  systemd.targets.network-online.wantedBy = pkgs.lib.mkForce [ ];

  services = {
    journald = {
      extraConfig = "SystemMaxUse=50M\nSystemMaxFiles=5";
      rateLimitBurst = 500;
    };
  };
}
