{ lib, pkgs, user, ... }:

{
  home.file.".config/rofi/config.rasi".source = ./config.rasi;
  home.file.".config/rofi/themes/colors.rasi".source = ./themes/colors.rasi;
}
