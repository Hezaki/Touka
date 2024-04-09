{ pkgs, ... }: {
  home.packages = with pkgs; [
    (wrapFirefox firefox-esr-115-unwrapped {
      extraPolicies = {
        CaptivePortal = false;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = true;
        DisableFormHistory = true;
        DisplayBookmarksToolbar = false;
        DontCheckDefaultBrowser = true;
        PromptForDownloadLocation = false;
        NetworkPrediction = false;
        showSearchBar = false;
        DisableSetDesktopBackground = true;
        LegacyProfiles = true;
        ManualAppUpdateOnly = true;
        Homepage = {
          Startpage = "previous-session";
        };

        SearchEngines = {
          Add = [
            {
              Name = "4get";
              URLTemplate = "https://4get.ca/web?s=";
            }
          ];
          Default = "4get";
          Remove = [
            "Google"
            "Bing"
            "Amazon.com"
            "eBay"
            "Twitter"
            "DuckDuckGo"
            "Wikipedia"
          ];
        };

        ExtensionSettings = let
          mkForceInstalled =
            builtins.mapAttrs
            (name: cfg: {installation_mode = "force_installed";} // cfg);
        in
          mkForceInstalled {
            # Theme
            "{0a2d1098-69a9-4e98-a62c-a861766ac24d}".install_url = "https://github.com/catppuccin/firefox/releases/download/old/catppuccin_mocha_lavender.xpi";
            # Tabs 
            "treestyletab@piro.sakura.ne.jp".install_url = "https://addons.mozilla.org/firefox/downloads/file/4197314/tree_style_tab-3.9.19.xpi";
            # Dark Reader
            "addon@darkreader.org".install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
            # Ublock Origin
            "uBlock0@raymondhill.net".install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            # SponsorBlock
            "sponsorBlocker@ajay.app".install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
            # Vimium-C
            "vimium-c@gdh1995.cn".install_url = "https://addons.mozilla.org/firefox/downloads/file/4210117/vimium_c-1.99.997.xpi";
            # NewTab like Vimium-C
            "newtab-adapter@gdh1995.cn".install_url = "https://addons.mozilla.org/firefox/downloads/file/3632463/newtab_adapter-1.3.0.xpi";
            # Tampermonkey
            "firefox@tampermonkey.net".install_url = "https://addons.mozilla.org/firefox/downloads/latest/tampermonkey/latest.xpi";
            # Translate
            "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}".install_url = "https://addons.mozilla.org/firefox/downloads/file/4165403/traduzir_paginas_web-9.9.0.30.xpi";
            # Search by Image
            "{2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c}".install_url = "https://addons.mozilla.org/firefox/downloads/file/4189577/search_by_image-6.1.0.xpi";
            # I don't care about Cookies
            "jid1-KKzOGWgsW3Ao4Q@jetpack".install_url = "https://addons.mozilla.org/firefox/downloads/file/4202634/i_dont_care_about_cookies-3.5.0.xpi";
            # Stylus
            "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}".install_url = "https://addons.mozilla.org/firefox/downloads/file/4232144/styl_us-1.5.46.xpi";
          };

        FirefoxHome = {
          Pocket = false;
          Snippets = false;
        };
        PasswordManagerEnabled = true;
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };

        SanitizeOnShutdown = {
          Cache = true;
          History = false;
          Cookies = false;
          Downloads = true;
          FormData = true;
          Sessions = true;
          OfflineApps = true;
        };

        Preferences = {
          "browser.startup.homepage" = "https://4get.ca/";
          "browser.toolbars.bookmarks.visibility" = "never";
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "toolkit.zoomManager.zoomValues" = ".8,.90,.95,1,1.1,1.2";
          "browser.uidensity" = 1;
          "extensions.webextensions.restrictedDomains" = "";
          "privacy.resistFingerprinting.block_mozAddonManager" = true;
          "privacy.webrtc.legacyGlobalIndicator" = false;
          "http://127.0.0.1/" = "http://127.0.0.1/";
          "app.vendorURL" = "http://127.0.0.1/";
          "app.privacyURL" = "http://127.0.0.1/";
          "plugins.hide_infobar_for_missing_plugin" = true;
          "plugins.hide_infobar_for_outdated_plugin" = true;
          "plugins.notifyMissingFlash" = false;
          "network.http.pipelining" = true;
          "network.http.proxy.pipelining" = true;
          "network.http.pipelining.maxrequests" = 10;
          "nglayout.initialpaint.delay" = 0;
          "network.cookie.cookieBehavior" = 1;
          "privacy.firstparty.isolate" = true;
          "extensions.update.enabled" = false;
          "intl.locale.matchOS" = true;
          "extensions.langpacks.signatures.required" = false;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.EULA.override" = true;
          "extensions.autoDisableScopes" = 3;
          "extensions.shownSelectionUI" = true;
          "extensions.blocklist.enabled" = false;
          "app.update.url" = "http://127.0.0.1/";
          "startup.homepage_welcome_url" = "";
          "browser.startup.homepage_override.mstone" = "ignore";
          "app.support.baseURL" = "http://127.0.0.1/";
          "app.support.inputURL" = "http://127.0.0.1/";
          "app.feedback.baseURL" = "http://127.0.0.1/";
          "browser.uitour.url" = "http://127.0.0.1/";
          "browser.uitour.themeOrigin" = "http://127.0.0.1/";
          "plugins.update.url" = "http://127.0.0.1/";
          "browser.customizemode.tip0.learnMoreUrl" = "http://127.0.0.1/";
          "browser.dictionaries.download.url" = "http://127.0.0.1/";
          "browser.search.searchEnginesURL" = "http://127.0.0.1/";
          "layout.spellcheckDefault" = 0;
          "browser.download.useDownloadDir" = false;
          "browser.aboutConfig.showWarning" = false;
          "browser.translation.engine" = "";
          "media.gmp-provider.enabled" = false;
          "browser.urlbar.update2.engineAliasRefresh" = true;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
          "browser.urlbar.suggest.engines" = false;
          "browser.urlbar.suggest.topsites" = false;
          "security.OCSP.enabled" = 0;
          "security.OCSP.require" = false;
          "browser.discovery.containers.enabled" = false;
          "browser.discovery.enabled" = false;
          "services.sync.prefs.sync.browser.startup.homepage" = false;
          "browser.contentblocking.report.monitor.home_page_url" = "http://127.0.0.1/";
          "dom.ipc.plugins.flash.subprocess.crashreporter.enabled" = false;
          "browser.safebrowsing.enabled" = false;
          "browser.safebrowsing.downloads.remote.enabled" = false;
          "browser.safebrowsing.malware.enabled" = false;
          "browser.safebrowsing.provider.google.updateURL" = "";
          "browser.safebrowsing.provider.google.gethashURL" = "";
          "browser.safebrowsing.provider.google4.updateURL" = "";
          "browser.safebrowsing.provider.google4.gethashURL" = "";
          "browser.safebrowsing.provider.mozilla.gethashURL" = "";
          "browser.safebrowsing.provider.mozilla.updateURL" = "";
          "services.sync.privacyURL" = "http://127.0.0.1/";
          "social.enabled" = false;
          "social.remote-install.enabled" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "datareporting.healthreport.about.reportUrl" = "datareporting.healthreport.about.reportUrl";
          "datareporting.healthreport.documentServerURI" = "http://127.0.0.1/";
          "healthreport.uploadEnabled" = false;
          "social.toast-notifications.enabled" = false;
          "datareporting.healthreport.service.enabled" = false;
          "browser.slowStartup.notificationDisabled" = true;
          "network.http.sendRefererHeader" = 2;
          "network.http.referer.spoofSource" = true;
          "network.http.originextension" = false;
          "dom.event.clipboardevents.enabled" = true;
          "network.user_prefetch-next" = false;
          "network.dns.disablePrefetch" = true;
          "network.http.sendSecureXSiteReferrer" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.server" = "";
          "experiments.manifest.uri" = "";
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "plugins.enumerable_names" = "";
          "plugin.state.flash" = 0;
          "browser.search.update" = false;
          "dom.battery.enabled" = false;
          "device.sensors.enabled" = false;
          "camera.control.face_detection.enabled" = false;
          "camera.control.autofocus_moving_callback.enabled" = false;
          "network.http.speculative-parallel-limit" = 0;
          "browser.urlbar.userMadeSearchSuggestionsChoice" = true;
          "browser.search.suggest.enabled" = false;
          "browser.sessionstore.max_resumed_crashes" = 1;
          "browser.sessionstore.resume_from_crash" = true;
          "security.certerrors.mitm.priming.enabled" = false;
          "security.certerrors.recordEventTelemetry" = false;
          "extensions.shield-recipe-client.enabled" = false;
          "browser.newtabpage.directory.source" = "";
          "browser.newtabpage.directory.ping" = "";
          "browser.newtabpage.introShown" = true;
          "privacy.trackingprotection.enabled" = false;
          "privacy.trackingprotection.pbmode.enabled" = false;
          "urlclassifier.trackingTable" = "test-track-simple,base-track-digest256,content-track-digest256";
          "privacy.donottrackheader.enabled" = false;
          "privacy.trackingprotection.introURL" = "https://www.mozilla.org/%LOCALE%/firefox/%VERSION%/tracking-protection/start/";
          "geo.enabled" = false;
          "geo.wifi.uri" = "";
          "browser.search.geoip.url" = "";
          "browser.search.geoSpecificDefaults" = false;
          "browser.search.geoSpecificDefaults.url" = "";
          "browser.search.modernConfig" = false;
          "captivedetect.canonicalURL" = "";
          "network.captive-portal-service.enabled" = false;
          "privacy.resistFingerprinting" = true;
          "webgl.disabled" = true;
          "privacy.trackingprotection.cryptomining.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;
          "gecko.handlerService.schemes.mailto.0.name" = "";
          "gecko.handlerService.schemes.mailto.1.name" = "";
          "handlerService.schemes.mailto.1.uriTemplate" = "";
          "gecko.handlerService.schemes.mailto.0.uriTemplate" = "";
          "browser.contentHandlers.types.0.title" = "";
          "browser.contentHandlers.types.0.uri" = "";
          "browser.contentHandlers.types.1.title" = "";
          "browser.contentHandlers.types.1.uri" = "";
          "gecko.handlerService.schemes.webcal.0.name" = "";
          "gecko.handlerService.schemes.irc.0.name" = "";
          "gecko.handlerService.schemes.irc.0.uriTemplate" = "";
          "gecko.handlerService.schemes.webcal.0.uriTemplate" = "";
          "extensions.webservice.discoverURL" = "http://127.0.0.1/";
          "extensions.getAddons.search.url" = "http://127.0.0.1/";
          "extensions.getAddons.search.browseURL" = "http://127.0.0.1/";
          "extensions.getAddons.get.url" = "http://127.0.0.1/";
          "extensions.getAddons.link.url" = "http://127.0.0.1/";
          "extensions.getAddons.discovery.api_url" = "http://127.0.0.1/";
          "extensions.systemAddon.update.url" = "";
          "extensions.systemAddon.update.enabled" = false;
          "extensions.getAddons.langpacks.url" = "http://127.0.0.1/";
          "lightweightThemes.getMoreURL" = "http://127.0.0.1/";
          "browser.geolocation.warning.infoURL" = "";
          "browser.xr.warning.infoURL" = "";
          "pfs.datasource.url" = "http://127.0.0.1/";
          "pfs.filehint.url" = "http://127.0.0.1/";
          "media.gmp-manager.url.override" = "data:text/plain,";
          "media.gmp-manager.url" = "";
          "media.gmp-manager.updateEnabled" = false;
          "media.gmp-gmpopenh264.enabled" = false;
          "media.gmp-eme-adobe.enabled" = false;
          "middlemouse.contentLoadURL" = false;
          "browser.selfsupport.url" = "";
          "browser.apps.URL" = "";
          "loop.enabled" = false;
          "browser.user_preferences.inContent" = false;
          "browser.aboutHomeSnippets.updateUrl" = "data:text/html";
          "browser.user_preferences.moreFromMozilla" = false;
          "gfx.direct2d.disabled" = true;
          "browser.casting.enabled" = false;
          "social.directories" = "";
          "security.ssl.errorReporting.enabled" = false;
          "security.tls.unrestricted_rc4_fallback" = false;
          "security.tls.insecure_fallback_hosts.use_static_list" = false;
          "security.tls.version.min" = 1;
          "security.ssl.require_safe_negotiation" = false;
          "security.ssl.treat_unsafe_negotiation_as_broken" = true;
          "security.ssl3.rsa_seed_sha" = true;
          "security.ssl3.dhe_rsa_aes_128_sha" = false;
          "security.ssl3.dhe_rsa_aes_256_sha" = false;
          "security.ssl3.dhe_dss_aes_128_sha" = false;
          "security.ssl3.dhe_rsa_des_ede3_sha" = false;
          "security.ssl3.rsa_des_ede3_sha" = false;
          "browser.pocket.enabled" = false;
          "extensions.pocket.enabled" = false;
          "browser.preferences.moreFromMozilla" = false;
          "extensions.allowPrivateBrowsingByDefault" = true;
          "network.IDN_show_punycode" = true;
          "extensions.screenshots.disabled" = true;
          "browser.onboarding.newtour" = "performance,private,addons,customize,default";
          "browser.onboarding.updatetour" = "performance,library,singlesearch,customize";
          "browser.onboarding.enabled" = false;
          "browser.newtabpage.activity-stream.showTopSites" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.feeds.snippets" = false;
          "browser.newtabpage.activity-stream.disableSnippets" = true;
          "browser.newtabpage.activity-stream.tippyTop.service.endpoint" = "";
          "gfx.xrender.enabled" = true;
          "dom.webnotifications.enabled" = false;
          "dom.webnotifications.serviceworker.enabled" = false;
          "dom.push.enabled" = false;
          "browser.newtabpage.activity-stream.asrouter.useruser_prefs.cfr" = false;
          "extensions.htmlaboutaddons.discover.enabled" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "services.settings.server" = "";
          "browser.region.network.scan" = false;
          "browser.contentblocking.report.hide_vpn_banner" = true;
          "browser.contentblocking.report.mobile-ios.url" = "";
          "browser.contentblocking.report.mobile-android.url" = "";
          "browser.contentblocking.report.show_mobile_app" = false;
          "browser.contentblocking.report.vpn.enabled" = false;
          "browser.contentblocking.report.vpn.url" = "";
          "browser.contentblocking.report.vpn-promo.url" = "";
          "browser.contentblocking.report.vpn-android.url" = "";
          "browser.contentblocking.report.vpn-ios.url" = "";
          "browser.privatebrowsing.promoEnabled" = false;
          "browser.region.network.url" = "";
          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_send_http_background_request" = false;
          "browser.xul.error_pages.expert_bad_cert" = true;
          "layout.css.font-visibility.private" = 1;
          "layout.css.font-visibility.standard" = 1;
          "layout.css.font-visibility.trackingprotection" = 1;
          "privacy.userContext.enabled" = true;
          "privacy.userContext.ui.enabled" = true;
          "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
          "media.peerconnection.ice.default_address_only" = true;
          "dom.disable_window_move_resize" = true;
          "accessibility.force_disabled" = 1;
          "browser.helperApps.deleteTempFileOnExit" = true;
          "browser.uitour.enabled" = false;
          "devtools.debugger.remote-enabled" = false;
          "webchannel.allowObject.urlWhitelist" = "";
          "permissions.manager.defaultsUrl" = "";
          "permissions.default.shortcuts" = "1";
          "pdfjs.enableScripting" = false;
          "permissions.delegation.enabled" = false;
          "browser.contentblocking.category" = "strict";
          "security.tls.version.enable-deprecated" = false;
          "extensions.webcompat.enable_shims" = true;
          "privacy.resistFingerprinting.letterboxing" = true;
          "privacy.window.maxInnerWidth" = 1600;
          "privacy.window.maxInnerHeight" = 900;
        };
      };
    })
  ];
  home.file = {
    ".mozilla/firefox/hezaki.default-release/chrome/userChrome.css".text = ''
      * {
        font-family: JetBrainsMono Nerd Font Mono !important;
        font-size: 12pt !important;
      }

      #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
        display: none;
      }

      #main-window:not([customizing]) #navigator-toolbox:not(:focus-within):not(:hover) { visibility: collapse !important; }
      #back-button { display: none; }
      #forward-button { display: none; }
      #reload-button { display: none; }
      #stop-button { display: none; }
      #home-button { display: none; }
      #downloads-button { display: none; }
      #library-button { display: none; }
      #identity-box { display: none; }
      #pageActionButton { display: none; }
      #pocket-button { display: none; }
      #urlbar-zoom-button { display: none; }
      #tracking-protection-icon-container { display: none !important; }
      #reader-mode-button{ display: none !important; }
      #star-button { display: none; }
      #star-button-box { display: none; }
      #urlbar-go-button { display: none; }
      #userContext-label, #userContext-indicator { display: none !important;}
      #fxa-toolbar-menu-button { display: none; }
      #nav-bar-overflow-button { display: none !important; }
      #PanelUI-button { display: none; }
      #customizableui-special-spring1,
      #customizableui-special-spring2 { display: none; }
    '';
    ".mozilla/firefox/hezaki.default-release/chrome/userContent.css".text = ''
      * {
        font-family: JetBrainsMono Nerd Font Mono;
      }
      @-moz-document regexp("moz-extension://.+/sidebar/sidebar.html.*") {
        :root,
        #background {
          background-color: #504945; /* https://github.com/piroor/treestyletab/blob/0eede581d763f92344fe64b1c042839f3b8ca955/webextensions/resources/ui-color.css#L198 */
        }
      }
      @-moz-document regexp("moz-extension://.+/resources/group-tab.html.*") {
        :root {
          background: #504945 !important;
        }
      }

      @-moz-document url-prefix("about:"), url("about:home"), url("about:newtab"), url("about:privatebrowsing") {
        :root {
            --in-content-page-background: #282828 !important;
            --logo-and-wordmark{ display: none !important; }
        }
      }

      @-moz-document url-prefix(about:home), url-prefix(about:newtab){

        body[lwt-newtab-brighttext] {
            --newtab-background-color: #282828 !important;
            --newtab-background-color-secondary: #282828 !important;

        }

        .top-site-outer .top-site-icon {
            background-color: #282828 !important;

        }

        .top-site-outer .tile {
            background-color: #282828 !important;
        }

        .top-sites-list:not(.dnd-active) .top-site-outer:is(.active, :focus, :hover) {
            background: #282828 !important;
        }

        .top-site-outer .context-menu-button:is(:active, :focus) {
            background-color: #282828 !important;
        }

        .search-wrapper .search-handoff-button {
            border-radius: 40px !important;
            background-color: #282828 !important;
        }
      }
    '';
    ".mozilla/firefox/hezaki.default-release/chrome/main.html".text = ''
      <!DOCTYPE html>
      <html>
      <head>
        <title>hmpage</title> 
      </head>
        <body style="background: url('/etc/nixos/home/hezaki/themes/images/cat_leaves.png') no-repeat fixed !important; background-size: cover !important;">
        </body>
      </html>
    '';
  };
}
