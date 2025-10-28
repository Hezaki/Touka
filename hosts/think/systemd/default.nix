{ pkgs, ... }:
{
  systemd = {
    watchdog.rebootTime = "0";
    targets.network-online.wantedBy = pkgs.lib.mkForce [ ];
  };
  services = {
    journald = {
      extraConfig = "SystemMaxUse=50M\nSystemMaxFiles=5";
      rateLimitBurst = 500;
      rateLimitInterval = "30s";
    };
    # logind.extraConfig = ''
    #   IdleAction=suspend
    #   IdleActionSec=300
    # '';
  };
}
