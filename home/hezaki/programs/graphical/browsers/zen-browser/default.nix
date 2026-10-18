{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
with config.lib.stylix.colors;
{
  imports = [ inputs.zen-browser.homeModules.twilight ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    languagePacks = [
      "en-US"
      "ru-RU"
    ];

    profiles = {
      hqzk = {
        id = 0;
        isDefault = true;
        presets.betterfox.enable = true;

        keyboardShortcuts = [
          {
            id = "key_quitApplication";
            disabled = true;
          }

          {
            id = "zen-new-empty-split-view";
            keycode = "VK_RETURN";
            modifiers = {
              shift = true;
              control = true;
            };
          }

          {
            id = "zen-toggle-sidebar";
            key = "s";
            modifiers.control = true;
          }
        ];

        mods = [
          "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # Better Unloaded Tabs
          "642854b5-88b4-4c40-b256-e035532109df" # Zen transparent
          "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
          "5941aefd-67b0-453d-9b62-9071a31cbb0d" # Smaller Compact Mode
        ];

        extensions = {
          force = true;

          packages = with pkgs.firefox-addons; [
            ublock-origin
            sponsorblock
            vimium-ff
            vimium-new-tab-page
            clearurls
            privacy-badger17
            ultrawideo
            w2g
            firenvim
            return-youtube-dislikes
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
          "layout.css.devPixelsPerPx" = 1.05;
          "browser.display.use_system_colors" = true;
          "dom.webgpu.enabled" = true;

          # zen
          "zen.view.compact.hide-tabbar" = true;
          "zen.view.compact.hide-toolbar" = true;
          "zen.urlbar.open-on-startup" = false;
          "zen.urlbar.behavior" = "float";
          "zen.window-sync.enabled" = false;
          "zen.glance.enabled" = false;

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
      ShowHomeButton = false;

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
    };
  };
}
