{ config, ... }:
with config.lib.stylix.colors;
{
  xdg.configFile = {
    "tridactyl/tridactylrc".text = # bash
      ''
        set smoothscroll true
        set keyboardlayoutforce true
      '';

    "tridactyl/themes/main.css" = # css
      ''
        :root {
            --tridactyl-fg: #${base04};
            --tridactyl-bg: #${base00};
            --tridactyl-cmdl-fg: #${base04};
            --tridactyl-cmdl-bg: #${base00};
        }
      '';
  };
}
