{ config, ... }:
with config.lib.stylix.colors;
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
          --tridactyl-fg: #${base04};
          --tridactyl-bg: #${base00};
          --tridactyl-cmdl-fg: #${base04};
          --tridactyl-cmdl-bg: #${base00};
          --tridactyl-url-fg: #${base05};
          --tridactyl-status-border: 1.5px solid #${base01};
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
