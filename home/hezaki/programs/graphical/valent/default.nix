{ pkgs, ... }:
{
  services.kdeconnect = {
    enable = true;
    package = pkgs.valent;
  };
}
