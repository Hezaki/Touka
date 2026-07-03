{ lib, ... }:

{
  environment = {
    variables = {
      ROC_ENABLE_PRE_VEGA = "1";
      LIBVA_DRIVER_NAME = "radeonsi";
      QT_QPA_PLATFORMTHEME = lib.mkForce "termfilechooser";
      QS_ICON_THEME = "Papirus-Dark";
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
