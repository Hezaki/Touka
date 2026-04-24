let
  hasIPv6Internet = true;
  StateDirectory = "dnscrypt-proxy";
in
{
  services = {
    dnscrypt-proxy = {
      enable = true;
      settings = {
        sources.public-resolvers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
          ];
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
          cache_file = "/var/lib/${StateDirectory}/public-resolvers.md";
        };

        ipv6_servers = hasIPv6Internet;
        block_ipv6 = !(hasIPv6Internet);

        require_dnssec = true;
        require_nolog = false;
        require_nofilter = true;

        lb_strategy = "p2";

        server_names = [
          "cloudflare"
          "quad9"
          "adguard-dns"
          "comss.one"
          "mullvad-adblock-doh"
        ];
      };
    };
    resolved.enable = false;
  };

  systemd.services.dnscrypt-proxy.serviceConfig.StateDirectory = StateDirectory;
}
