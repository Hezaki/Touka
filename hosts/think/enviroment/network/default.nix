{
  networking = {
    hostName = "think";
    nameservers = [
      "127.0.0.1"
      "::1"
    ];

    networkmanager = {
      enable = true;
      dns = "none";

      wifi = {
        powersave = true;
        macAddress = "random";
      };
    };

    dhcpcd = {
      wait = "background";
      extraConfig = "noarp";
    };

    firewall = {
      trustedInterfaces = [ "tailscale0" ];
      allowedTCPPorts = [ 8000 ];

      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];

      allowedUDPPortRanges = [
        {
          from = 52000;
          to = 52100;
        }
      ];
    };
  };

  services.tailscale.enable = true;

  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;
}
