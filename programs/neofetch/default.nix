{ lib, pkgs, user, ... }:

{
  home.file.".config/neofetch/config.conf".source = ./config.conf;
  home.file.".config/neofetch/arch.conf".source = ./arch.conf;
  home.file.".config/neofetch/alpine.conf".source = ./alpine.conf;
}
