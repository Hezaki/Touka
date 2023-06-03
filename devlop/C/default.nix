{ pkgs, ... }:

{
  home.packages = with pkgs; with python311Packages; [
    gcc
    gnumake
    pkg-config
    glib
  ];
}

