{ config, pkgs, ... }: {
  programs.firefox = {
    enable = true;
  };
  home.file.".mozilla/firefox/hezaki.default-release/user.js".source = ./user.js;
  home.file.".mozilla/firefox/hezaki.default-release/chrome".source = ./chrome;
  home.file.".mozilla/firefox/hezaki.default-release/chrome/bg.png".source = ./bg.png;
}
