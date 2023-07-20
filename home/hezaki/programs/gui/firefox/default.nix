{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
  };

  home.file.".mozzila/firefox/hezaki.default-release/chrome".source = ./chrome;
  home.file.".mozzila/firefox/hezaki.default-release/user.js".source = ./user.js;
}
