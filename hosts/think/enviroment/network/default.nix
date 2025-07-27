{ pkgs, ... }:
{
  networking = {
    hostName = "think";

    networkmanager = {
      enable = true;
      plugins = with pkgs; [ networkmanager-openvpn ];
      insertNameservers = [
        "8.8.8.8"
        "8.8.4.4"
        "1.1.1.1"
        "1.0.0.1"
        "208.67.222.222"
        "208.67.220.220"
        "149.112.112.112"
      ];
    };

    dhcpcd = {
      wait = "background";
      extraConfig = "noarp";
    };

    # defaultGateway = {
    #   address = "192.168.0.1";
    #   interface = "wlp3s0";
    # };

    firewall = rec {
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };
}
