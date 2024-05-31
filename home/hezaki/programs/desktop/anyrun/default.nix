{ inputs, pkgs, config, ... }: {
  imports = [ inputs.anyrun.homeManagerModules.default ];
  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink
        translate
        shell
        symbols
        translate
        kidex
        dictionary
        websearch
      ];
      closeOnClick = true;
      hidePluginInfo = true;
      hideIcons = false;
      layer = "overlay";
      maxEntries = 6;
      width = { fraction = 0.220000; };
    };

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
          desktop_actions: false,
          max_entries: 10,
          terminal: Some("foot"),
        )
      '';

      "symbols.ron".text = ''
        Config(
          prefix: ":emo",

          symbols: {
            // "name": "text to be copied"
            "shrug": "¯\\_(ツ)_/¯",
          },

          max_entries: 10,
        )
      '';

      "translate.ron".text = ''
        Config(
          prefix: ":tr",
          language_delimiter: ">",
          max_entries: 1,
        )
      '';

      "websearch.ron".text = ''
        Config(
          prefix: ":s",
          engines: [DuckDuckGo] 
        )
      '';

      "shell.ron".text = ''
        Config(
          prefix: ":sh",
          shell: zsh,
        )
      '';
      "kidex.ron".text = ''
        Config(
          max_entries: 6,
        )
      '';
      "dictionary.ron".text = ''
        Config(
          prefix: ":def",
          max_entries: 6,
        )
      '';
    };

    extraCss = ''
      * {
        font-family: JetBrainsMono NerdFont, SF Nerd Mono;
        font-size: 1.1rem;
      }

      #window,
      #match,
      #plugin,
      #main {
        background: transparent;
      }

      #match:selected {
        background: #${config.lib.stylix.colors.base03};
      }

      #match {
        padding: 3px;
        margin: 2px;
        border-radius: 9px;
      }

      #entry, #plugin:hover {
        border-radius: 9px;
      }

      box#main {
        padding: 0px;
        margin-top: 160px;
        box-shadow: 1 1 3 1px #1C1D1D;
        background: #${config.lib.stylix.colors.base00};
        border-radius: 9px;
        border: 2;
        border-color: #${config.lib.stylix.colors.base00};
        border-style: solid;
      }
    '';
  };
}
