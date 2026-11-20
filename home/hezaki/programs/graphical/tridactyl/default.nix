{ config, ... }:
with config.lib.stylix.colors;
let
  font = config.stylix.fonts.monospace.name;
in
{
  xdg.configFile = {
    "tridactyl/tridactylrc".text = # bash
      ''
        set smoothscroll true
        set scrollduration 135
        set keyboardlayoutforce true
        set hintstyles.bg none
      '';

    "tridactyl/themes/main.css".text = # css
      ''
        :root {
          --tridactyl-font-family: "${font}";
          --tridactyl-font-size: 25px; 
          --tridactyl-small-font-size: 12px;

          --tridactyl-fg: #${base04};
          --tridactyl-bg: #${base00};
          --tridactyl-cmdl-fg: #${base04};
          --tridactyl-cmdl-bg: #${base00};
          --tridactyl-url-fg: #${base05};
          --tridactyl-status-border: 1.5px solid #${base01};
          --tridactyl-status-border-radius: 16px;
        }

        .TridactylStatusIndicator {
          margin: 4px !important;
        }

        :root .sectionHeader {
          background: var(--tridactyl-cmplt-bg) !important;
          background-image: none !important;
        }

        span.TridactylHint {
          background: #${base02} !important;
          color: #${base04} !important;
          border: 1px solid #${base03} !important;
          border-radius: 16px !important;
        }
      '';
  };
}
