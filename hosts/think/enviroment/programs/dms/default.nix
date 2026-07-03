{ inputs, pkgs, ... }:
{
  imports = with inputs; [ dms.nixosModules.dank-material-shell ];

  programs.dms-shell = {
    enable = true;
    package = inputs.dms.packages.${pkgs.system}.default;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };
  };
}
