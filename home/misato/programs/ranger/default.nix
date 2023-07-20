{ lib, pkgs, user, ... }:

{
  home.file.".config/ranger/commands.py".source = ./config/commands.py;
  home.file.".config/ranger/plugins".source = ./config/plugins;
  home.file.".config/ranger/rc.conf".source = ./config/rc.conf;
}
