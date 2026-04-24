{ inputs, ... }:
{
  imports = with inputs; [ tg-ws-proxy.nixosModules.tg-ws-proxy ];

  services.tg-ws-proxy = {
    enable = true;
    host = "127.0.0.1";
    port = 1443;
    secret = "023fc0b32867d70e8d6ee030721b64db";
  };
}
