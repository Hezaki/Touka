{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    gnumake
    pkg-config
    glibc
    python311Packages.ipython
    # nginx
    distrobox
    cargo

    nixd
    nixpkgs-fmt
    lua-language-server
  ];
}
