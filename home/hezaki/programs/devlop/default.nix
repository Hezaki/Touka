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

    nixd
    nixfmt-rfc-style
    prettierd
  ];
}
