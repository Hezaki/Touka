{ pkgs, lib, ... }:
with lib; let
  catppuccin-mocha = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "0f2c393b11dd8174002803835ef7640635100ca3";
    hash = "sha256-iUnLLAQVMXFLyoB3wgYqUTx5SafLkvtOXK6C8EHK/nI=";
  };
in {
  home.packages = with pkgs; [
    webcord-vencord
  ];

  xdg.configFile = {
    "WebCord/Themes/mocha" = {
      source = "${catppuccin-mocha}/themes/mocha.theme.css";
    };
    "webcord/config.json".text = ''
      {
          "settings": {
              "general": {
                  "menuBar": {
                      "hide": true
                  },
                  "tray": {
                      "disable": true
                  },
                  "taskbar": {
                      "flash": true
                  },
                  "window": {
                      "transparent": false,
                      "hideOnClose": true
                  }
              },
              "privacy": {
                  "blockApi": {
                      "science": true,
                      "typingIndicator": false,
                      "fingerprinting": true
                  },
                  "permissions": {
                      "video": null,
                      "audio": null,
                      "fullscreen": true,
                      "notifications": null,
                      "display-capture": true,
                      "background-sync": false
                  }
              },
              "advanced": {
                  "csp": {
                      "enabled": true
                  },
                  "cspThirdParty": {
                      "spotify": true,
                      "gif": true,
                      "hcaptcha": true,
                      "youtube": true,
                      "twitter": true,
                      "twitch": true,
                      "streamable": true,
                      "vimeo": false,
                      "soundcloud": true,
                      "paypal": false,
                      "audius": true,
                      "algolia": true,
                      "reddit": true,
                      "googleStorageApi": true
                  },
                  "currentInstance": {
                      "radio": 0
                  },
                  "devel": {
                      "enabled": false
                  },
                  "redirection": {
                      "warn": true
                  },
                  "optimize": {
                      "gpu": true
                  },
                  "webApi": {
                      "webGl": true
                  },
                  "unix": {
                      "autoscroll": true
                  }
              }
          },
          "update": {
              "notification": {
                  "version": "",
                  "till": ""
              }
          },
          "screenShareStore": {
              "audio": false
          }
      }
    '';
  };
}
