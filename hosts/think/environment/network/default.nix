{
  networking = {
    hostName = "think";
    useNetworkd = true;

    wireless.iwd = {
      enable = true;

      settings = {
        Settings.AutoConnect = true;
        Network.EnableIPv6 = true;
      };
    };

    nameservers = [
      "127.0.0.1"
      "::1"
    ];

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

  systemd.network = {
    enable = true;
    wait-online.enable = false;

    networks = {
      "20-ethernet-main" = {
        matchConfig.Name = "enp5s0";

        networkConfig = {
          DHCP = "yes";
          IPv6PrivacyExtensions = "kernel";
        };

        dhcpV4Config = {
          RouteMetric = 10;
          UseDNS = false;
        };
      };

      "25-ethernet-unplugged" = {
        matchConfig.Name = "enp2s0f0";

        networkConfig = {
          DHCP = "no";
          LinkLocalAddressing = "no";
          ConfigureWithoutCarrier = false;
        };
      };
    };
  };

  services.tailscale.enable = true;

  boot.initrd.systemd.network.wait-online.enable = false;
}
