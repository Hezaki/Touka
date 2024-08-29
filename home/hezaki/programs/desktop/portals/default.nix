{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    # xdgOpenUsePortal = true;
    config.common.default = "gtk";
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };
}
