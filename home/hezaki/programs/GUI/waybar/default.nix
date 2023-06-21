{ config, pkgs, inputs, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or []) ++ ["-Dexperimental=true"];
    });
  };
  home.file = {
    ".config/waybar/config.jsonc".source = ./config.jsonc;
    ".config/waybar/style.css".source = ./style.css;
  };
}
