{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    gnumake
    pkg-config
    glibc
    python311Packages.ipython

    nixd
    nixpkgs-fmt
    lua-language-server
  ];
}
