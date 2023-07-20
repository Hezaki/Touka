{ lib, pkgs, inputs, ... }: {
  home.file = {
    ".config/hypr/hyprland.conf".source = ./hyprland.conf;
    ".config/hypr/settings.conf".source = ./settings.conf;
    ".config/hypr/decoration.conf".source = ./decoration.conf;
    ".config/hypr/autostat.sh".source = ./autostart.sh;
    ".config/hypr/binds.conf".source = ./binds.conf;
    ".config/hypr/rules.conf".source = ./rules.conf;
  };
}
