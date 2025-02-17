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
    luajitPackages.jsregexp
    lua
    lua-language-server
    nodejs

    nixd
    nixfmt-rfc-style
  ];
}
