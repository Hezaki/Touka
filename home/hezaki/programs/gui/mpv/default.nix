{ lib, pkgs, user, ... }:

{
  home.file.".config/mpv/input.conf".source = ./input.conf;
}
