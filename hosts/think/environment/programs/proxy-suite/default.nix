{ inputs, ... }:

{
  imports = with inputs; [ proxy-suite.nixosModules.default ];

  services.proxy-suite = {
    enable = true;

    proxy = {
      enable = true;

      selection = "urltest";

      tun.enable = true;

      subscriptions = [
        {
          tag = "pig";
          url = "https://gitlab.com/avencores/goida-vpn-configs/-/raw/main/githubmirror/6.txt";
        } # https://gitlab.com/avencores/goida-vpn-configs
      ];
    };

    zapret = {
      enable = true;

      zapret-discord-youtube = {
        configName = "general(ALT12)";
        gameFilter = "all";
      };
    };

    tgWsProxy = {
      enable = true;
      secret = "2ebbe132a1cd7daa83901c9bc7b4c8d6";
    };
  };
}
