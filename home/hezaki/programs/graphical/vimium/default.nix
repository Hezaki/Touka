{ inputs, config, ... }:

{
  imports = [ inputs.vimium-options.homeManagerModules.vimium-options ];

  home.vimiumOptions = {
    enable = true;
    ignoreKeyboardLayout = true;

    searchEngines = {
      yt = "https://www.youtube.com/results?search_query=%s YouTube";
      ytm = "https://music.youtube.com/search?q=%s YT Music";
      re = "https://www.reddit.com/search/?q=%s Reddit";
      wiki = "https://www.wikipedia.org/w/index.php?title=Special:Search&search=%s Wikipedia";
      yat = "https://translate.yandex.com/?source_lang=en&target_lang=ru&text=%s Yandex Translate";
      ns = "https://search.nixos.org/packages?&query=%s Nixpkgs search";
      hs = "https://home-manager-options.extranix.com/?query=%s Home manager search";
      gh = "https://github.com/search?q=%s GitHub";
      fh = "https://flathub.org/en/apps/search?q=%s FlatHub";
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
        background: var(--bg);
        border: 1px solid var(--border);
        box-shadow: var(--shadow);
        border-radius: 15px;
        overflow: hidden;
        left: 50%;
        margin-left: -400px;
        max-width: 800px;
      }

      #vomnibar #vomnibar-search-area,
      #vomnibar input {
        background: transparent;
        border: none;
        box-shadow: none;
        color: var(--fg);
        font-family: var(--font);
        font-size: var(--font-size);
        font-weight: var(--font-weight-medium);
      }

      #vomnibar #vomnibar-search-area {
        padding: 14px 50px;
        border-radius: 6px;
      }

      #vomnibar input {
        border: none;
        padding: var(--padding);
      }

      #vomnibar #vomnibar-search-area::before {
        content: "";
        position: absolute;
        top: 22px;
        left: 20px;
        background-image: url("data:image/svg+xml;utf8,<svg viewBox='0 0 24 24' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M14.9536 14.9458L21 21M17 10C17 13.866 13.866 17 10 17C6.13401 17 3 13.866 3 10C3 6.13401 6.13401 3 10 3C13.866 3 17 6.13401 17 10Z' stroke='%23dfdfdf' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'/></svg>");
        background-repeat: no-repeat;
        background-size: contain;
        width: 18px;
        height: 18px;
      }

      .no-insert-text {
        display: none;
      }

      #vomnibar ul {
        background: transparent;
        border-top: 2px solid var(--border);
        margin: 0 15px;
        margin-bottom: 5px;
        padding: var(--padding-vomnibar);
      }

      #vomnibar li {
        border-bottom: none;
        padding: 15px;
      }

      #vomnibar li .top-half {
        padding: var(--padding);
      }

      #vomnibar li .bottom-half {
        padding: 0px 0px 0px 2px;
        margin: 0;
      }

      #vomnibar li .source {
        color: var(--fg-dark);
        font-family: var(--font);
        font-size: var(--font-size-title);
        font-weight: var(--font-weight-bold);
        text-transform: capitalize;
      }

      #vomnibar li em,
      #vomnibar li .title {
        color: var(--fg);
        font-family: var(--font);
        font-size: var(--font-size-title);
        font-weight: var(--font-weight-medium);
      }

      #vomnibar li .url {
        color: var(--fg-url);
        font-family: var(--font);
        font-size: var(--font-size-url);
        font-weight: var(--font-weight-medium);
      }

      #vomnibar li .match {
        color: var(--fg-match);
      }

      #vomnibar li .title .match {
        color: var(--fg);
        font-weight: bold;
      }

      #vomnibar li.selected {
        background-color: var(--bg-selected);
        backdrop-filter: blur(20px);
        border-radius: 8px;
      }

      #vomnibar li.selected .url {
        color: var(--fg-url);
      }

      #vomnibar li.selected .match {
        color: var(--fg);
      }

      /* Hints Marks*/

      #vimium-hint-marker-container div.internal-vimium-hint-marker,
      #vimium-hint-marker-container div.vimiumHintMarker {
        background: var(--bg);
        border: none;
        box-shadow: var(--shadow);
        padding: 3px 4px;
      }

      #vimium-hint-marker-container div span {
        color: var(--fg-hints);
        font-family: var(--font);
        font-size: var(--font-size-hints);
        font-weight: var(--font-weight-bold);
        text-shadow: none;
      }

      #vimium-hint-marker-container div > .matchingCharacter {
        opacity: 0.3;
      }

      #vimium-hint-marker-container div > .matchingCharacter ~ span {
        color: var(--fg-hints);
      }

      /* Hud */

      #hud-container {
        background: var(--bg);
        border: 1px solid var(--border);
        box-shadow: var(--shadow);
        border-radius: 6px;
      }

      #hud-container span#hud-find-input,
      #hud-container #hud {
        color: var(--fg);
        font-family: var(--font);
        font-size: 13;
        font-weight: var(--font-weight-medium);
      }

      #hud-container .hud-find {
        background-color: transparent;
        border: none;
      }

      #hud-container #search-area {
        background-color: transparent;
        padding: 6px;
      }
    '';
  };
}
