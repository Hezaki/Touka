{ inputs, ... }:
{
  imports = with inputs; [
    matugen-nix.homeManagerModules.default
    matugen-nix-templates.homeModules.default
  ];

  matugen = {
    enable = true;
    wallpaper = ../images/wp.png;
    mode = "dark";
    prefer = "tonal-spot";
  };
}
