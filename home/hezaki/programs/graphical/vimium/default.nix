{ inputs, config, ... }:

{
  imports = [ inputs.vimium-options.homeManagerModules.vimium-options ];

  home.vimiumOptions = {
    enable = true;
    ignoreKeyboardLayout = true;

    searchEngines = {
      re = "https://www.reddit.com/search/?q=%s Reddit";
      wiki = "https://www.wikipedia.org/w/index.php?title=Special:Search&search=%s Wikipedia";
      ns = "https://search.nixos.org/packages?&query=%s Nixpkgs search";
      hs = "https://home-manager-options.extranix.com/?query=%s Home manager search";
      gh = "https://github.com/search?q=%s GitHub";
      fh = "https://flathub.org/en/apps/search?q=%s FlatHub";
      exc = "https://excalidraw.com/ Excalidraw";
    };

    keyMappings = {
      unmap = [ "shift+t" ];
    };

    # https://github.com/lexesj/vimium-zen-theme <3
    userDefinedLinkHintCss = with config.lib.stylix.colors; ''
      :root {
        --font-size: 18px;
        --font-size-title: 16px;
        --font-size-hints: 12px;
        --font-size-url: 12px;

        --font-weight: normal;
        --font-weight-medium: medium;
        --font-weight-bold: bold;

        --font: "Inter", "Noto Serif", "Arial", sans-serif;

        --padding: 2px;
        --padding-vomnibar: 10px 0;
        --shadow: 0px 20px 40px 0px rgba(0, 0, 0, 0.25);
        --blur: 40px;

        /* Vomnibar & hud */
        --fg: #${base04};
        --fg-dark: #${base04};
        --fg-match: #${base04};
        --fg-url: #${base04};

        --bg: #${base00};
        --bg-selected: rgba(150, 150, 150, 0.3);

        --border: #${base01};

        /* Hints */
        --fg-hints: #${base04};
      }

      #vomnibar {
        background: var(--bg) !important;
        border: 1px solid var(--border) !important;
        box-shadow: var(--shadow) !important;
        border-radius: 34px !important;
        overflow: hidden !important;
        left: 50% !important;
        margin-left: -400px !important;
        max-width: 800px !important;
        backdrop-filter: blur(var(--blur)) !important;
      }

      #vomnibar #vomnibar-search-area,
      #vomnibar input {
        background: transparent !important;
        border: none !important;
        box-shadow: none !important;
        color: var(--fg) !important;
        font-family: var(--font) !important;
        font-size: var(--font-size) !important;
        font-weight: var(--font-weight-medium) !important;
      }

      #vomnibar #vomnibar-search-area {
        padding: 14px 50px !important;
        border-radius: 6px !important;
      }

      #vomnibar input {
        border: none !important;
        padding: var(--padding) !important;
      }

      #vomnibar #vomnibar-search-area::before {
        content: "" !important;
        position: absolute !important;
        top: 22px !important;
        left: 20px !important;
        background-image: url("data:image/svg+xml;utf8,<svg viewBox='0 0 24 24' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M14.9536 14.9458L21 21M17 10C17 13.866 13.866 17 10 17C6.13401 17 3 13.866 3 10C3 6.13401 6.13401 3 10 3C13.866 3 17 6.13401 17 10Z' stroke='%23ffffff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'/></svg>") !important;
        background-repeat: no-repeat !important;
        background-size: contain !important;
        width: 18px !important;
        height: 18px !important;
      }

      .no-insert-text {
        display: none !important;
      }

      #vomnibar ul {
        background: transparent !important;
        border-top: 2px solid var(--border) !important;
        margin: 0 15px !important;
        margin-bottom: 5px !important;
        padding: var(--padding-vomnibar) !important;
      }

      #vomnibar li {
        border-bottom: none !important;
        padding: 15px !important;
      }

      #vomnibar li .top-half {
        padding: var(--padding) !important;
      }

      #vomnibar li .bottom-half {
        padding: 0px 0px 0px 2px !important;
        margin: 0 !important;
      }

      #vomnibar li .source {
        color: var(--fg-dark) !important;
        font-family: var(--font) !important;
        font-size: var(--font-size-title) !important;
        font-weight: var(--font-weight-bold) !important;
        text-transform: capitalize !important;
      }

      #vomnibar li em,
      #vomnibar li .title {
        color: var(--fg) !important;
        font-family: var(--font) !important;
        font-size: var(--font-size-title) !important;
        font-weight: var(--font-weight-medium) !important;
      }

      #vomnibar li .url {
        color: var(--fg-url) !important;
        font-family: var(--font) !important;
        font-size: var(--font-size-url) !important;
        font-weight: var(--font-weight-medium) !important;
      }

      #vomnibar li .match {
        color: var(--fg-match) !important;
      }

      #vomnibar li .title .match {
        color: var(--fg) !important;
        font-weight: bold !important;
      }

      #vomnibar li.selected {
        background-color: var(--bg-selected) !important;
        backdrop-filter: blur(20px) !important;
        border-radius: 12px !important;
      }

      #vomnibar li.selected .url {
        color: var(--fg-url) !important;
      }

      #vomnibar li.selected .match {
        color: var(--fg) !important;
      }

      #vimium-hint-marker-container div.internal-vimium-hint-marker,
      #vimium-hint-marker-container div.vimiumHintMarker {
        background: rgba(20, 20, 30, 0.85) !important;
        border: 1px solid rgba(255, 255, 255, 0.2) !important;
        box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.3) !important;
        padding: 4px 6px !important;
        border-radius: 12px !important;
        backdrop-filter: blur(15px) !important;
      }

      #vimium-hint-marker-container div span {
        color: #ffffff !important;
        font-family: var(--font) !important;
        font-size: var(--font-size-hints) !important;
        font-weight: bold !important;
        text-shadow: 0 0 5px rgba(0,0,0,0.5) !important;
      }

      #vimium-hint-marker-container div > .matchingCharacter {
        opacity: 0.4 !important;
      }

      #hud-container {
        background: rgba(20, 20, 30, 0.85) !important;
        border: 1px solid rgba(255, 255, 255, 0.2) !important;
        box-shadow: var(--shadow) !important;
        border-radius: 16px !important;
        backdrop-filter: blur(20px) !important;
      }

      #hud-container span#hud-find-input,
      #hud-container #hud {
        color: #ffffff !important;
        font-family: var(--font) !important;
        font-size: 14px !important;
        font-weight: var(--font-weight-medium) !important;
      }

      #hud-container .hud-find {
        background-color: transparent !important;
        border: none !important;
      }

      #hud-container #search-area {
        background-color: transparent !important;
        padding: 8px !important;
      }
    '';
  };
}
