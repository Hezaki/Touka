{ lib, pkgs, user, ... }:

{
  home.file.".config/neofetch/config.conf".source = ./config.conf;
  home.file.".config/neofetch/c2.conf".source = ./c2.conf;
}
