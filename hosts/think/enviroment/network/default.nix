{
  networking = {
    hostName = "think";
    networkmanager = {
      enable = true;
      insertNameservers = [ "8.8.8.8" ];
    };
    dhcpcd = {
      wait = "background";
      extraConfig = "noarp";
    };
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
    };

    wg-quick.interfaces."WARP" = {
      type = "amneziawg";
      autostart = true;

      privateKey = "0Bb5eK4XtRQwCOjN1qVCRBH1rC6FutpDDO0O/xTI+VI=";
      extraOptions = {
        S1 = 0;
        S2 = 0;
        Jc = 120;
        Jmin = 93;
        Jmax = 911;
        H1 = 1;
        H2 = 2;
        H3 = 3;
        H4 = 4;
      };
      mtu = 1280;
      address = [
        "172.16.0.2"
        "2606:4700:110:8356:7ac7:2c9e:9b6c:1a7b"
      ];
      dns = [
        "1.1.1.1"
        "2606:4700:4700::1111"
        "1.0.0.1"
        "2606:4700:4700::1001"
      ];

      peers = [
        {
          publicKey = "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=";
          allowedIPs = [
            "0.0.0.0/0"
            "::/0"
          ];
          endpoint = "engage.cloudflareclient.com:2408";
        }
      ];
    };

    hosts = {
      "127.0.0.1" = [ "localhost" ];
      "::1" = [ "localhost" ];
      "127.0.02" = [ "ms7996" ];
      "50.7.85.219" = [ "inference.codeium.com" ];
      "50.7.87.83" = [ "proxy.individual.githubcopilot.com" ];
      "142.54.189.106" = [ "web.archive.org" ];
      "204.12.192.220" = [ "developer.nvidia.com" ];
      "50.7.85.222" = [ "www.canva.com" ];
      "204.12.192.222" = [
        "chatgpt.com"
        "ab.chatgpt.com"
        "auth.openai.com"
        "auth0.openai.com"
        "platform.openai.com"
        "cdn.oaistatic.com"
        "files.oaiusercontent.com"
        "cdn.auth0.com"
        "tcr9i.chat.openai.com"
        "webrtc.chatgpt.com"
        "api.openai.com"
        "sora.com"
        "gemini.google.com"
        "aistudio.google.com"
        "generativelanguage.googleapis.com"
        "alkalimakersuite-pa.clients6.google.com"
        "aitestkitchen.withgoogle.com"
        "webchannel-alkalimakersuite-pa.clients6.google.com"
        "o.pki.goog"
        "labs.google"
        "notebooklm.google"
        "notebooklm.google.com"
        "copilot.microsoft.com"
        "sydney.bing.com"
        "edgeservices.bing.com"
        "api.spotify.com"
        "xpui.app.spotify.com"
        "appresolve.spotify.com"
        "login5.spotify.com"
        "gew1-spclient.spotify.com"
        "spclient.wg.spotify.com"
        "api-partner.spotify.com"
        "aet.spotify.com"
        "www.spotify.com"
        "accounts.spotify.com"
        "claude.ai"
        "www.notion.so"
        "www.intel.com"
      ];
      "204.12.192.219" = [
        "android.chat.openai.com"
        "aisandbox-pa.googleapis.com"
      ];
      "204.12.192.221" = [
        "operator.chatgpt.com"
        "alkalimakersuite-pa.clients6.google.com"
        "assistant-s3-pa.googleapis.com"
        "rewards.bing.com"
      ];
      "50.7.87.85" = [
        "proactivebackend-pa.googleapis.com"
        "codeium.com"
      ];
      "50.7.85.221" = [
        "xsts.auth.xboxlive.com"
        "api.individual.githubcopilot.com"
      ];
      "138.201.204.218" = [
        "encore.scdn.co"
        "ap-gew1.spotify.com"
      ];
      "50.7.87.84" = [
        "login.app.spotify.com"
        "api.github.com"
      ];
    };
  };
}
