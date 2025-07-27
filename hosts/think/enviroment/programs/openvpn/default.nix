{ pkgs, ... }:
{
  programs.openvpn3 = {
    enable = true;
    package = pkgs.openvpn;
  };
}
