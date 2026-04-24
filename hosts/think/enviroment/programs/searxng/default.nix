{ lib, ... }:
{
  services.searx = {
    enable = false;
    redisCreateLocally = true;

    settings = {
      server = {
        port = 8080;
        bind_address = "127.0.0.1";
        secret_key = "UDpHukUJMtNkdTcSPiMLSZBaNSwPJPNKRWkBtouGlrfSxRiPMf";
        image_proxy = true;
      };

      search = {
        autocomplete_min = 0;
        autocomplete = "google";
        ban_time_on_fail = 5;
        max_ban_time_on_fail = 120;
        favicon_resolver = "google";
        formats = ["html" "json" "rss"];
      };

      ui = {
        static_use_hash = true;
        default_locale = "en";
        query_in_title = true;
        infinite_scroll = true;
        center_alignment = true;
        default_theme = "simple";
        results_on_new_tab = true;
        theme_args.simple_style = "auto";
        search_on_category_select = false;
        hotkeys = "vim";
        default_favicon_resolver = "google";
      };

      engines = lib.mapAttrsToList (name: value: { inherit name; } // value) {
        "startpage".disabled = true;
        "startpage images".disabled = true;
        "duckduckgo".disabled = false;
        "google".disabled = false;
        "brave".disabled = true;
        "bing".disabled = true;
        "mojeek".disabled = true;
        "mwmbl".disabled = true;
        "mwmbl".weight = 0.4;
        "qwant".disabled = true;
        "crowdview".disabled = true;
        "crowdview".weight = 0.5;
        "curlie".disabled = true;
        "ddg definitions".disabled = true;
        "ddg definitions".weight = 2;
        "wikipedia".disabled = false;
        "wikibooks".disabled = true;
        "wikidata".disabled = true;
        "wikiquote".disabled = true;
        "wikisource".disabled = true;
        "wikispecies".disabled = true;
        "wikispecies".weight = 0.5;
        "wikiversity".disabled = true;
        "wikiversity".weight = 0.5;
        "wikivoyage".disabled = true;
        "wikivoyage".weight = 0.5;
        "currency".disabled = true;
        "dictzone".disabled = true;
        "lingva".disabled = true;
        "bing images".disabled = true;
        "brave.images".disabled = true;
        "duckduckgo images".disabled = true;
        "google images".disabled = false;
        "qwant images".disabled = true;
        "1x".disabled = true;
        "artic".disabled = true;
        "deviantart".disabled = false;
        "flickr".disabled = true;
        "imgur".disabled = false;
        "library of congress".disabled = true;
        "material icons".disabled = true;
        "material icons".weight = 0.2;
        "openverse".disabled = true;
        "pinterest".disabled = true;
        "svgrepo".disabled = true;
        "unsplash".disabled = false;
        "wallhaven".disabled = false;
        "wikicommons.images".disabled = true;
        "yacy images".disabled = true;
        "bing videos".disabled = true;
        "brave.videos".disabled = true;
        "duckduckgo videos".disabled = true;
        "google videos".disabled = false;
        "qwant videos".disabled = true;
        "dailymotion".disabled = true;
        "google play movies".disabled = true;
        "invidious".disabled = true;
        "odysee".disabled = true;
        "peertube".disabled = true;
        "piped".disabled = true;
        "rumble".disabled = true;
        "sepiasearch".disabled = true;
        "vimeo".disabled = true;
        "youtube".disabled = false;
        "brave.news".disabled = true;
        "google news".disabled = true;
      };

      enabled_plugins = [
        "Basic Calculator"
        # "Hash plugin"
        # "Tor check plugin"
        "Open Access DOI rewrite"
        "Hostnames plugin"
        "Unit converter plugin"
        "Tracker URL remover"
      ];
    };
  };
}
