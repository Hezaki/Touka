{ pkgs, lib, ... }:
{
  systemd.targets.network-online.wantedBy = pkgs.lib.mkForce [ ];

  systemd.services = {
    tailscaled = {
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      wantedBy = lib.mkForce [ "multi-user.target" ];
    };

    disable-micmute-led = {
      wantedBy = [ "multi-user.target" ];
      after = [ "sound.target" ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${pkgs.bash}/bin/bash -c 'echo off > /sys/class/sound/ctl-led/mic/mode'";
      };
    };
  };

  services = {
    journald = {
      extraConfig = "SystemMaxUse=50M\nSystemMaxFiles=5";
      rateLimitBurst = 500;
    };
  };
}
