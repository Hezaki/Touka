{
  environment = {
    variables = {
      ROC_ENABLE_PRE_VEGA = "1";
      LIBVA_DRIVER_NAME = "radeonsi";
    };
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
