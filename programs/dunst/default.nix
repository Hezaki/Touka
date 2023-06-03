{ lib, pkgs, user, ... }:

{
  home.file.".config/dunst/dunstrc".source = ./config/dunstrc;
}
