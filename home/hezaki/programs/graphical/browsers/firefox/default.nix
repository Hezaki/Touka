{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:

with config.lib.stylix.colors;

{
  programs.firefox = {
    enable = true;

    profiles = {
      hezaki = {
        id = 0;
        isDefault = false;
        extensions.force = true;
      };

      hqzk = {
        id = 1;
        isDefault = true;
        extensions = {
          force = true;
          packages = with pkgs.firefox-addons; [
            ublock-origin
            sponsorblock
            vimium-ff
            vimium-new-tab-page
            clearurls
            youtube-addon
            violentmonkey
            traduzir-paginas-web
            privacy-badger17
            ultrawideo
            pywalfox
          ];

          settings = {
            "uBlock0@raymondhill.net".settings = {
              userSettings = {
                uiTheme = "dark";
                uiAccentCustom = true;
                uiAccentCustom0 = "#${base00}";
                cloudStorageEnabled = false;
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

            "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}".settings = {
              hotkey-toggle-translation = "Ctrl+Alt+X";
              hotkey-translate-selected-text = "Ctrl+Alt+S";
              hotkey-swap-page-translation-service = "Ctrl+Alt+Q";
              hotkey-show-original = "Shift+Alt+0";
              hotkey-translate-page-1 = "Shift+Alt+1";
              hotkey-translate-page-2 = "Shift+Alt+2";
              hotkey-translate-page-3 = "Shift+Alt+3";
              hotkey-hot-translate-selected-text = "";
              targetLanguage = "ru";
            };
          };
        };

        settings = {
          "browser.ctrlTab.sortByRecentlyUsed" = true;
          "browser.uidensity" = 1;
          "browser.display.use_system_colors" = true;

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

          # Secure DNS
          # "network.trr.uri" = "";
          "network.trr.mode" = 3;
          "network.trr.max-fails" = 5;
        };

        search = {
          force = true;

          default = "SearXNG";
          engines = {
            "SearXNG" = {
              urls = [
                {
                  template = "https://priv.au/search";
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

        userChrome = ''
          * {
            font-family: Inter !important;
            font-size: 15px;
            /* border-radius: 18px !important; */
          }

          .tab-background {
            border-radius: 18px !important;
            max-height: 24px !important;
            min-height: 24px !important;
          }

          #tabbrowser-tabs {
            border-radius: 0px !important;
            border-inline-start: none !important;
            max-height: 32px !important;
            min-height: 32px !important;

          }

          #firefox-view-button,
          #alltabs-button,
          #tabs-newtab-button,
          .titlebar-close,
          .tab-close-button,
          .titlebar-spacer,
          .titlebar-button,
          .titlebar-min {
            display: none !important;
          }

          #urlbar-background {
            border-radius: 18px !important;
          }

          :root:not([customizing]):has(#tabbrowser-tabs[orient="horizontal"]) {
            #TabsToolbar {
              z-index: 9999 !important;
              background-color: inherit !important;
            }

            #TabsToolbar:not(:focus) {
              opacity: 1 !important;
            }

            #nav-bar {
              transition: margin-top 0.3s ease !important;
              margin-top: -30px !important;
              & #urlbar {
                visibility: collapse !important; /* hidden with the nav bar */
              }
            }

            #TabsToolbar:hover ~ #nav-bar,
            #nav-bar:hover,
            #nav-bar:focus-within {
              margin-top: 0px !important;
              & #urlbar {
                visibility: visible !important; /* visible with the nav bar */
              }
            }
          }
        '';

        userContent =
          with config.lib.stylix.colors.withHashtag;
          # css
          ''
            /* background setting */
            @-moz-document ${
              lib.concatStringsSep ", " [
                ''url("about:home")''
                ''url("about:newtab")''
              ]
            } {
              body {
                background-image: linear-gradient(135deg, rgba(255,255,255,0.1), rgba(255,255,255,0)),
                background-position: center !important;
                background-repeat: no-repeat !important;
                background-attachment: fixed !important;
                backdrop-filter: blur(4px) saturate(180%) brightness(0.7) !important;
              }
            }

            /* searchbar colorize */
            .search-wrapper .search-handoff-button, .search-wrapper input {
            	background: ${base01} !important;
            	border-radius: 96px !important;
            	color: ${base05} !important;
            }

            /* hide right-bottom button */
            .personalizeButtonWrapper { display: none !important; }
          '';

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
      Homepage.Startpage = "previous-session";

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
          "SearXNG - searx.be"
          "StartPage"
          "Twitter"
          "Wikipedia"
          "Wikipedia (en)"
        ];
      };

      ShowHomeButton = false;
    };
  };
}
