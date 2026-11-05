{ inputs, config, ... }:
{
  imports = [ inputs.proxy-suite.nixosModules.default ];

  services.proxy-suite = {
    enable = true;

    killSwitch = {
      enable = true;
      allowedSubnets = [ "192.168.0.0/16" ];
    };

    proxy = {
      enable = true;
      autostart = "tun";
      selection = "selector";
      tun.enable = true;

      subscriptions = [
        {
          tag = "main";
          updateInterval = "3h";
          urlFile = "${config.sops.secrets."vepen".path}";
        }
      ];
    };

    tgWsProxy = {
      enable = true;
      secretFile = "${config.sops.secrets."tgwsp-secret".path}";
    };
  };

  systemd.services.proxy-suite-socks.serviceConfig.PrivateTmp = true;
}
