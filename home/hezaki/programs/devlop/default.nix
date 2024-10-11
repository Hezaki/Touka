{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    gnumake
    pkg-config
    glibc
    python311Packages.ipython
    luarocks
    bun

    nixd
    nixfmt-rfc-style
  ];
}
