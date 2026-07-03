let
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
          refresh_delay = 73;
        };

        log_files_max_size = 10;
        log_files_max_age = 7;
        log_files_max_backups = 1;

        cache = true;
        cache_size = 4096;
        cache_min_ttl = 2400;
        cache_max_ttl = 86400;
        cache_neg_min_ttl = 60;
        cache_neg_max_ttl = 600;

        require_dnssec = true;
        require_nolog = true;
        require_nofilter = true;

        force_tcp = true;
        doh_servers = true;

        server_names = [
          "comss.one"
          "yandex"
          "cloudflare"
          "google"
        ];
      };
    };
    resolved.enable = false;
  };

  systemd.services.dnscrypt-proxy.serviceConfig.StateDirectory = StateDirectory;
}
