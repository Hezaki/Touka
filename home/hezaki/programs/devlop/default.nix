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
    stylua
    emmet-language-server
    nodejs
    vscode-langservers-extracted
    gopls
    luajitPackages.jsregexp
    lua-language-server

    nixd
    nixfmt-rfc-style
    prettierd
  ];
}
