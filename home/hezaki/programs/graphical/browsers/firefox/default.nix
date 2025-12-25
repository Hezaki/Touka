{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    (wrapFirefox firefox-unwrapped {
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
        Homepage.Startpage = "previous-session";
        SearchEngines = {
          Default = "DuckDuckGo";
          Remove = [
            "Google"
            "Bing"
            "Amazon.com"
            "eBay"
            "Twitter"
            "Wikipedia"
          ];
        };
        ExtensionSettings =
          let
            mkForceInstalled = builtins.mapAttrs (name: cfg: { installation_mode = "force_installed"; } // cfg);
          in
          mkForceInstalled {
            # Ublock Origin
            "uBlock0@raymondhill.net".install_url =
              "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            # SponsorBlock
            "sponsorBlocker@ajay.app".install_url =
              "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
            # Vimium-C
            "vimium-c@gdh1995.cn".install_url =
              "https://addons.mozilla.org/firefox/downloads/file/4210117/vimium_c-1.99.997.xpi";
            # NewTab like Vimium-C
            "newtab-adapter@gdh1995.cn".install_url =
              "https://addons.mozilla.org/firefox/downloads/file/3632463/newtab_adapter-1.3.0.xpi";
            # Greasemonkey
            "{e4a8a97b-f2ed-450b-b12d-ee082ba24781}".install_url =
              "https://addons.mozilla.org/firefox/downloads/file/4332091/greasemonkey-4.13.xpi";
            # Copyfish
            "copyfish@a9t9.com".install_url =
              "https://addons.mozilla.org/firefox/downloads/file/3765111/copyfish_ocr_software-5.1.9.xpi";
            # Translate
            "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}".install_url =
              "https://addons.mozilla.org/firefox/downloads/file/4165403/traduzir_paginas_web-9.9.0.30.xpi";
            # I don't care about Cookies
            "jid1-KKzOGWgsW3Ao4Q@jetpack".install_url =
              "https://addons.mozilla.org/firefox/downloads/file/4202634/i_dont_care_about_cookies-3.5.0.xpi";
            # ClearURLs
            "{74145f27-f039-47ce-a470-a662b129930a}".install_url =
              "https://addons.mozilla.org/firefox/downloads/file/4064884/clearurls-1.26.1.xpi";
            # firenvim
            "firenvim@lacamb.re".install_url =
              "https://addons.mozilla.org/firefox/downloads/file/4279173/firenvim-0.2.16.xpi";
            # w2g
            "{6ea0a676-b3ef-48aa-b23d-24c8876945fb}".install_url =
              "https://addons.mozilla.org/firefox/downloads/file/4337397/w2g-10.3.xpi";
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
          # fastfox
          "content.notify.interval" = 100000;
          "gfx.canvas.accelerated.cache-items" = 4096;
          "gfx.canvas.accelerated.cache-size" = 512;
          "gfx.content.skia-font-cache-size" = 20;
          "browser.cache.jsbc_compression_level" = 3;
          "media.memory_cache_max_size" = 65536;
          "media.cache_readahead_limit" = 7200;
          "media.cache_resume_threshold" = 3600;
          "image.mem.decode_bytes_at_a_time" = 32768;
          "network.http.max-connections" = 1800;
          "network.http.max-persistent-connections-per-server" = 10;
          "network.http.max-urgent-start-excessive-connections-per-host" = 5;
          "network.http.pacing.requests.enabled" = false;
          "network.dnsCacheExpiration" = 3600;
          "network.ssl_tokens_cache_capacity" = 10240;
          "network.dns.disablePrefetch" = true;
          "network.dns.disablePrefetchFromHTTPS" = true;
          "network.prefetch-next" = false;
          "network.predictor.enabled" = false;
          "network.predictor.enable-prefetch" = false;
          "layout.css.grid-template-masonry-value.enabled" = true;
          "dom.enable_web_task_scheduling" = true;
          "dom.security.sanitizer.enabled" = true;

          # securefox
          "browser.contentblocking.category" = "strict";
          "urlclassifier.trackingSkipURLs" = "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com";
          "urlclassifier.features.socialtracking.skipURLs" = "*.instagram.com, *.twitter.com, *.twimg.com";
          "network.cookie.sameSite.noneRequiresSecure" = true;
          "browser.download.start_downloads_in_tmp_dir" = true;
          "browser.helperApps.deleteTempFileOnExit" = true;
          "browser.uitour.enabled" = false;
          "privacy.globalprivacycontrol.enabled" = true;
          "security.OCSP.enabled" = 0;
          "security.remote_settings.crlite_filters.enabled" = true;
          "security.pki.crlite_mode" = 2;
          "security.ssl.treat_unsafe_negotiation_as_broken" = true;
          "browser.xul.error_pages.expert_bad_cert" = true;
          "security.tls.enable_0rtt_data" = false;
          "browser.privatebrowsing.forceMediaMemoryCache" = true;
          "browser.sessionstore.interval" = 60000;
          "privacy.history.custom" = true;
          "browser.urlbar.trimHttps" = true;
          "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
          "browser.search.separatePrivateDefault.ui.enabled" = true;
          "browser.urlbar.update2.engineAliasRefresh" = true;
          "browser.search.suggest.enabled" = false;
          "browser.urlbar.quicksuggest.enabled" = false;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;
          "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
          "browser.urlbar.groupLabels.enabled" = false;
          "browser.formfill.enable" = false;
          "security.insecure_connection_text.enabled" = true;
          "security.insecure_connection_text.pbmode.enabled" = true;
          "network.IDN_show_punycode" = true;
          "dom.security.https_first" = true;
          "signon.formlessCapture.enabled" = false;
          "signon.privateBrowsingCapture.enabled" = false;
          "network.auth.subresource-http-auth-allow" = 1;
          "editor.truncate_user_pastes" = false;
          "security.mixed_content.block_display_content" = true;
          "pdfjs.enableScripting" = false;
          "extensions.postDownloadThirdPartyPrompt" = false;
          "network.http.referer.XOriginTrimmingPolicy" = 2;
          "privacy.userContext.ui.enabled" = true;
          "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
          "media.peerconnection.ice.default_address_only" = true;
          "browser.safebrowsing.downloads.remote.enabled" = false;
          "permissions.default.desktop-notification" = 2;
          "permissions.default.geo" = 2;
          "permissions.manager.defaultsUrl" = "";
          "webchannel.allowObject.urlWhitelist" = "";
          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.server" = "data:,";
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.coverage.opt-out" = true;
          "toolkit.coverage.opt-out" = true;
          "toolkit.coverage.endpoint.base" = "";
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "app.shield.optoutstudies.enabled" = false;
          "app.normandy.enabled" = false;
          "app.normandy.api_url" = "";
          "breakpad.reportURL" = "";
          "browser.tabs.crashReporting.sendReport" = false;
          "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
          "captivedetect.canonicalURL" = "";
          "network.captive-portal-service.enabled" = false;
          "network.connectivity-service.enabled" = false;

          # peskyfox
          "browser.privatebrowsing.vpnpromourl" = "";
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "browser.discovery.enabled" = false;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
          "browser.preferences.moreFromMozilla" = false;
          "browser.aboutConfig.showWarning" = false;
          "browser.aboutwelcome.enabled" = false;
          "browser.tabs.tabmanager.enabled" = false;
          "browser.profiles.enabled" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.compactmode.show" = true;
          "browser.display.focus_ring_on_anything" = true;
          "browser.display.focus_ring_style" = 0;
          "browser.display.focus_ring_width" = 0;
          "layout.css.prefers-color-scheme.content-override" = 2;
          "browser.newtabpage.activity-stream.newtabWallpapers.v2.enabled" = true;
          "cookiebanners.service.mode" = 1;
          "cookiebanners.service.mode.privateBrowsing" = 1;
          "full-screen-api.transition-duration.enter" = "0 0";
          "full-screen-api.transition-duration.leave" = "0 0";
          "full-screen-api.warning.delay" = -1;
          "full-screen-api.warning.timeout" = 0;
          "browser.urlbar.suggest.calculator" = true;
          "browser.urlbar.unitConversion.enabled" = true;
          "browser.urlbar.trending.featureGate" = false;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "extensions.pocket.enabled" = false;
          "browser.download.manager.addToRecentDocs" = false;
          "browser.download.open_pdf_attachments_inline" = true;
          "browser.bookmarks.openInTabClosesMenu" = false;
          "browser.menu.showViewImageInfo" = true;
          "findbar.highlightAll" = true;
          "layout.word_select.eat_space_to_next_word" = false;

          # smooth scrolling
          "general.smoothScroll" = true;
          "general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS" = 12;
          "general.smoothScroll.msdPhysics.enabled" = true;
          "general.smoothScroll.msdPhysics.motionBeginSpringConstant" = 600;
          "general.smoothScroll.msdPhysics.regularSpringConstant" = 650;
          "general.smoothScroll.msdPhysics.slowdownMinDeltaMS" = 25;
          "general.smoothScroll.msdPhysics.slowdownMinDeltaRatio" = "2";
          "general.smoothScroll.msdPhysics.slowdownSpringConstant" = 250;
          "general.smoothScroll.currentVelocityWeighting" = "1";
          "general.smoothScroll.stopDecelerationWeighting" = "1";
          "mousewheel.default.delta_multiplier_y" = 250;

          # other
          "browser.startup.homepage" = "https://duckduckgo.com/";
          "browser.startup.page" = 3;
          "browser.ctrlTab.sortByRecentlyUsed" = true;
          "browser.toolbars.bookmarks.visibility" = "never";
          "toolkit.zoomManager.zoomValues" = ".8,.90,.95,1,1.1,1.2";
          "browser.tabs.loadInBackground" = false;
          "browser.tabs.insertAfterCurrent" = true;
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
          "browser.EULA.override" = true;
          "extensions.autoDisableScopes" = 3;
          "extensions.shownSelectionUI" = true;
          "extensions.blocklist.enabled" = false;
          "app.update.url" = "http://127.0.0.1/";
          "startup.home;age_welcome_url" = "";
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
          "layout.spellcheckDefault" = 2;
          "browser.download.useDownloadDir" = false;
          "browser.translation.engine" = "";
          "media.gmp-provider.enabled" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.urlbar.suggest.engines" = false;
          "browser.urlbar.suggest.topsites" = false;
          "security.OCSP.require" = false;
          "browser.discovery.containers.enabled" = false;
          "services.sync.prefs.sync.browser.startup.homepage" = false;
          "browser.contentblocking.report.monitor.home_page_url" = "http://127.0.0.1/";
          "dom.ipc.plugins.flash.subprocess.crashreporter.enabled" = false;
          "browser.safebrowsing.enabled" = false;
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
          "network.http.sendSecureXSiteReferrer" = false;
          "experiments.manifest.uri" = "";
          "plugins.enumerable_names" = "";
          "plugin.state.flash" = 0;
          "browser.search.update" = false;
          "dom.battery.enabled" = false;
          "device.sensors.enabled" = false;
          "camera.control.face_detection.enabled" = false;
          "camera.control.autofocus_moving_callback.enabled" = false;
          "network.http.speculative-parallel-limit" = 0;
          "browser.urlbar.userMadeSearchSuggestionsChoice" = true;
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
          "privacy.trackingprotection.introURL" =
            "https://www.mozilla.org/%LOCALE%/firefox/%VERSION%/tracking-protection/start/";
          "geo.enabled" = false;
          "geo.wifi.uri" = "";
          "browser.search.geoip.url" = "";
          "browser.search.geoSpecificDefaults" = false;
          "browser.search.geoSpecificDefaults.url" = "";
          "browser.search.modernConfig" = false;
          "privacy.resistFingerprinting" = true;
          # "webgl.disabled" = true;
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
          "security.ssl3.rsa_seed_sha" = true;
          "security.ssl3.dhe_rsa_aes_128_sha" = false;
          "security.ssl3.dhe_rsa_aes_256_sha" = false;
          "security.ssl3.dhe_dss_aes_128_sha" = false;
          "security.ssl3.dhe_rsa_des_ede3_sha" = false;
          "security.ssl3.rsa_des_ede3_sha" = false;
          "browser.pocket.enabled" = false;
          "extensions.allowPrivateBrowsingByDefault" = true;
          "extensions.screenshots.disabled" = true;
          "browser.onboarding.newtour" = "performance,private,addons,customize,default";
          "browser.onboarding.updatetour" = "performance,library,singlesearch,customize";
          "browser.onboarding.enabled" = false;
          "browser.newtabpage.activity-stream.showTopSites" = false;
          "browser.newtabpage.activity-stream.feeds.snippets" = false;
          "browser.newtabpage.activity-stream.disableSnippets" = true;
          "browser.newtabpage.activity-stream.tippyTop.service.endpoint" = "";
          "gfx.xrender.enabled" = true;
          "dom.webnotifications.enabled" = false;
          "dom.webnotifications.serviceworker.enabled" = false;
          "dom.push.enabled" = false;
          "browser.newtabpage.activity-stream.asrouter.useruser_prefs.cfr" = false;
          "extensions.htmlaboutaddons.discover.enabled" = false;
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
          "layout.css.font-visibility.private" = 1;
          "layout.css.font-visibility.standard" = 1;
          "layout.css.font-visibility.trackingprotection" = 1;
          "privacy.userContext.enabled" = true;
          "dom.disable_window_move_resize" = true;
          "accessibility.force_disabled" = 1;
          "devtools.debugger.remote-enabled" = false;
          "permissions.default.shortcuts" = "1";
          "permissions.delegation.enabled" = false;
          "security.tls.version.enable-deprecated" = false;
          "extensions.webcompat.enable_shims" = true;
          "privacy.resistFingerprinting.letterboxing" = true;
          "privacy.window.maxInnerWidth" = 1600;
          "privacy.window.maxInnerHeight" = 900;
          "sidebar.revamp" = true;
          "sidebar.verticalTabs" = true;
        };
      };
    })
  ];
  home.file = {
    ".mozilla/firefox/hezaki.default-release/chrome/userChrome.css".text =
      with config.lib.stylix.colors; ''
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

        #browser-toolbox-background {
          background-color: #${base00};
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
    ".mozilla/firefox/hezaki.default-release/chrome/userContent.css".text =
      with config.lib.stylix.colors; ''
        * {}
        @-moz-document url-prefix("about:"), url("about:home"), url("about:newtab"), url("about:privatebrowsing") {
          :root {
            --in-content-page-background: #${base00} !important;
            --logo-and-wordmark{ display: none !important; }
          }
        }

        @-moz-document url-prefix(about:home), url-prefix(about:newtab){
          body[lwt-newtab-brighttext] {
            --newtab-background-color: #${base00} !important;
            --newtab-background-color-secondary: #${base00} !important;
          }

          .top-site-outer .top-site-icon,
          .top-site-outer .tile,
          .top-sites-list:not(.dnd-active) .top-site-outer:is(.active, :focus, :hover),
          .top-site-outer .context-menu-button:is(:active, :focus),
          .search-wrapper .search-handoff-button {
            background-color: #${base00} !important;
          }
        }
      '';
  };
}
