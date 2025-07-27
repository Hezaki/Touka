{ config, pkgs, ... }:
{
  home = {
    packages = with pkgs; [ nwg-dock-hyprland ];
    file.".config/nwg-dock-hyprland/style.css".text =
      with config.lib.stylix.colors; # css
      ''
        window {
          background-color: transparent;
        }

        #box {
          background: #${base00};
          border-style: none;
          border-width: 1px;
          box-shadow:
            0 0 0 1px rgba(238, 238, 238, 0.04) inset,
            2px 3px 8px 0 alpha(black, 0.4);
          padding: 5px;
          padding-top: 8px;
          border-radius: 15px;
          margin: 8px;
          margin-top: 0px;
        }

        #active {
        }

        button,
        image {
          background: none;
          border-style: none;
          box-shadow: none;
          color: #${base04};
        }

        button {
          padding: 4px;
          margin-left: 4px;
          margin-right: 4px;
          color: #${base05};
          font-size: 12px;
        }

        button:hover {
          background-color: rgba(238, 238, 238, 0.06);
          box-shadow: 0 0 0 1px rgba(238, 238, 238, 0.04) inset;
          border-radius: 15px;
        }

        button:focus {
          box-shadow: none;
        }
      '';
  };
}
