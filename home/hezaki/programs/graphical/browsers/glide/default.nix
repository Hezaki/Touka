{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:

with config.lib.stylix.colors;

{
  imports = [ inputs.glide-browser.homeModules.default ];

  programs.glide-browser = {
    enable = true;

    profiles = {
      hqzk = {
        id = 0;
        isDefault = true;
        extensions = {
          force = true;

          packages = with pkgs.firefox-addons; [
            ublock-origin
            sponsorblock
            # vimium-ff
            # vimium-new-tab-page
            clearurls
            privacy-badger17
            ultrawideo
            pywalfox
            w2g
            firenvim
            reddit-enhancer
            youtube-addon
          ];

          settings = {
            "uBlock0@raymondhill.net".settings = {
              userSettings = {
                uiTheme = "dark";
                uiAccentCustom = true;
                uiAccentCustom0 = "#${base00}";
                cloudStorageEnabled = lib.mkForce false;
              };

              selectedFilterLists = [
                "ublock-filters"
                "ublock-badware"
                "ublock-privacy"
                "ublock-unbreak"
                "ublock-quick-fixes"
                "easylist"
                "easyprivacy"
                "adguard-spyware-url"
                "urlhaus-1"
                "plowe-0"
                "fanboy-cookiemonster"
                "ublock-cookies-easylist"
                "fanboy-social"
                "easylist-annoyances"
                "fanboy-ai-suggestions"
                "easylist-chat"
                "easylist-newsletters"
                "easylist-notifications"
                "ublock-annoyances"
                "RUS-0"
                "RUS-1"
              ];
            };

            "{2339288d-f701-45d0-a57f-a847e9adc6cc}".settings = {
              mode = "normal";
            };
          };
        };

        settings = {
          "browser.startup.homepage" = "https://vimium.github.io/new-tab/";
          "browser.ctrlTab.sortByRecentlyUsed" = true;
          "browser.uidensity" = 1;
          "browser.display.use_system_colors" = true;
          "browser.nova.enabled" = false;

          # Parfait theme
          "parfait.window.borderless" = false;
          "parfait.blur.enabled" = false;
          "parfait.traffic-lights.enabled" = false;

          # disable geo & notify
          "permissions.default.geo" = 0;
          "permissions.default.desktop-notification" = 0;
          "geo.enabled" = false;

          # ff sync disable
          "identity.fxaccounts.enabled" = false;
          "browser.firefox-view.feature-tour" = "{\"screen\":\"\",\"complete\":true}";

          # disable login manager & autofill
          "signon.rememberSignons" = false;
          "extensions.formautofill.addresses.enabled" = false;
          "extensions.formautofill.creditCards.enabled" = false;

          # DNS
          "network.trr.mode" = 5;
        };

        search = {
          force = true;
          default = "Brave";

          engines = {
            "Brave" = {
              urls = [
                {
                  template = "https://search.brave.com/search";

                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
            };
          };
        };

        extraConfig =
          with inputs;
          lib.concatStringsSep "\n" (
            map (file: lib.readFile file) [
              "${betterfox}/Fastfox.js"
              "${betterfox}/Peskyfox.js"
              "${betterfox}/Securefox.js"
              "${betterfox}/Smoothfox.js"
              "${betterfox}/user.js"
            ]
          );
      };
    };
    policies = {
      Homepage.Startpage = "https://vimium.github.io/new-tab/";

      AppAutoUpdate = false;

      AutofillAddressEnabled = false;

      AutofillCreditCardEnabled = false;

      BackgroundAppUpdate = false;

      CaptivePortal = false;

      DisableAppUpdate = true;

      DisableBuiltinPDFViewer = true;

      DisableFirefoxScreenshots = true;

      DisableFirefoxStudies = true;

      DisableFormHistory = true;

      DisableMasterPasswordCreation = true;

      DisablePasswordReveal = true;

      DisablePocket = true;

      DisableProfileRefresh = true;

      DisableSetDesktopBackground = true;

      DisableTelemetry = true;

      DisplayBookmarksToolbar = false;

      DisplayMenuBar = "never";

      DontCheckDefaultBrowser = true;

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = false; # true -> force light theme
        EmailTracking = true;
      };

      ExtensionSettings = {
        "*" = {
          default_area = "menupanel";
          installation_mode = "allowed";
        };
      };

      FirefoxHome = {
        Pocket = false;
        Snippets = false;
      };

      GenerativeAI = {
        Enabled = false;
        Chatbot = false;
        LinkPreviews = false;
        TabGroups = false;
        Locked = false;
      };

      HardwareAcceleration = true;

      ManualAppUpdateOnly = true;

      NetworkPrediction = false;

      OfferToSaveLogins = false;

      OfferToSaveLoginsDefault = false;

      PDFjs.Enabled = false;

      PasswordManagerEnabled = false;

      PictureInPicture.Enabled = true;

      PrimaryPassword = false;

      PromptForDownloadLocation = false;

      SanitizeOnShutdown = {
        Cache = true;
        Cookies = false;
        Downloads = true;
        FormData = true;
        History = false;
        OfflineApps = true;
        Sessions = false;
      };

      SearchEngines = {
        Remove = [
          "Amazon.com"
          "Bing"
          "DuckDuckGo"
          "DuckDuckGo Lite"
          "eBay"
          "MetaGer"
          "Mojeek"
          "Perplexity"
          "StartPage"
          "Twitter"
          "Wikipedia"
          "Wikipedia (en)"
        ];
      };

      ShowHomeButton = false;
    };
  };

  xdg.configFile = with inputs; {
    "mozilla/firefox/hqzk/chrome/userChrome.css".source = "${parfait}/userChrome.css";
    "mozilla/firefox/hqzk/chrome/userContent.css".source = "${parfait}/userContent.css";
    "mozilla/firefox/hqzk/chrome/parfait".source = "${parfait}/parfait";
  };
}
