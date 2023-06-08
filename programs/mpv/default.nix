{ lib, pkgs, user, ... }:

{
  home.file.".config/mpv/input.conf".source = ./config/input.conf;
}
