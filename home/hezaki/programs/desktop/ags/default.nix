{ inputs, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = ./settings;
    extraPackages = with inputs.ags.packages.${pkgs.system}; [
      auth
      apps
      mpris
      greet
      notifd
      wireplumber
      powerprofiles
      network
      bluetooth
      battery
      tray
      hyprland
    ];
  };
}
