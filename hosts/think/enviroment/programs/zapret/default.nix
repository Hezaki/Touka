{ inputs, ... }:

{
  imports = with inputs; [ zapret-discord-youtube.nixosModules.default ];

  services.zapret-discord-youtube = {
    enable = true;
    configName = "general(ALT11)";

    listGeneral = [
      "cloudflare-dns.com"
      "cloudflare-ech.com"
      "cloudflare-esni.com"
      "cloudflare-gateway.com"
      "cloudflare-quic.com"
      "cloudflare.com"
      "cloudflare.net"
      "cloudflareaccess.com"
      "cloudflareapps.com"
      "cloudflarebolt.com"
      "cloudflareclient.com"
      "cloudflareinsights.com"
      "cloudflareok.com"
      "cloudflarepartners.com"
      "cloudflareportal.com"
      "cloudflarepreview.com"
      "cloudflareresolve.com"
      "cloudflaressl.com"
      "cloudflarestatus.com"
      "cloudflarestorage.com"
      "cloudflarestream.com"
      "cloudflaretest.com"
      "cloudflarewarp.com"
      "pacloudflare.com"
      "trycloudflare.com"
      "aws.amazon.com"
      "www.aws.amazon.com"
      "hetzner.com"
      "www.hetzner.com"
      "www.cineby.sc"
      "schneegans.de"
    ];

    ipsetAll = [
      "192.168.1.0/24"
      "10.0.0.1"
    ];

    gameFilter = "all";
  };
}
