{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    gnumake
    pkg-config
    glibc
    python311Packages.ipython
    luarocks

    nixd
    nixfmt-rfc-style
    lua-language-server
  ];
}
