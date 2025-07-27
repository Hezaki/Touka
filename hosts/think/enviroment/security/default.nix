{ pkgs, ... }:
let
  user = "hezaki";
in
{
  security = {
    sudo-rs = {
      enable = true;
      extraConfig = ''
        ${user} ALL=(ALL) NOPASSWD: ${pkgs.light}/bin/light
        ${user} ALL=(ALL) NOPASSWD: ${pkgs.coreutils}/bin/tee
      '';
    };
    polkit.enable = true;
  };
}
