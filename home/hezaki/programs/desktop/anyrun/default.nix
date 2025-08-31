{
  inputs,
  pkgs,
  config,
  ...
}:
{
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
        dictionary
        websearch
        stdin
      ];
      closeOnClick = true;
      hidePluginInfo = true;
      hideIcons = false;
      layer = "overlay";
      maxEntries = 8;
      width = {
        absolute = 370;
      };
    };

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
          desktop_actions: false,
          terminal: Some("kitty"),
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
          prefix: "?",
          engines: [DuckDuckGo] 
        )
      '';

      "shell.ron".text = ''
        Config(
          prefix: ":t",
          shell: zsh,
        )
      '';
      "dictionary.ron".text = ''
        Config(
          prefix: ":def",
          max_entries: 8,
        )
      '';
    };
    extraCss =
      with config.lib.stylix.colors; # css
      ''
        * {
          font-family: Inter;
          font-size: 1.1rem;
        }

        #window,
        #match,
        #plugin,
        #main {
          background: transparent;
        }

        #match:selected {
          background: #${base03};
        }

        #match {
          padding: 3px;
          margin: 2px;
          border-radius: 20px;
        }

        #entry, #plugin:hover {
          border-radius: 20px;
          margin: 2px;
        }

        box#main {
          padding: 0px;
          margin-top: 160px;
          box-shadow: 1 1 3 1px #1C1D1D;
          background: #${base00};
          border-radius: 20px;
          border: 1;
          border-color: #${base03};
          border-style: solid;
        }
      '';
  };
}
