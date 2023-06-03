{ lib, pkgs, user, ... }:

{
  home.file.".config/zathura/zathurarc".source = ./config/zathurarc;
  home.file.".config/zathura/zathurarc_gruvbox".source = ./config/zathura-gruvbox;
}
