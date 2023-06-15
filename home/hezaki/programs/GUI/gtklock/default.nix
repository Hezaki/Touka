{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    gtklock
    pam
  ];
}
