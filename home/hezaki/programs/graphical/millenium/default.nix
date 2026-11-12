{ pkgs, inputs, ... }:

{
  imports = with inputs; [ nixos-millennium.nixosModules.default ];

  programs.steam = {
    theme = pkgs.millenniumThemes.material-theme;
  };
}
