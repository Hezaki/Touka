{
  pkgs,
  inputs,
  ...
}:

{
  imports = with inputs; [
    chaotic.vendored.jovian.nixosModules.default
  ];

  programs = {
    gamescope.enable = true;

    steam = {
      enable = true;
      protontricks.enable = true;

      package = pkgs.steam.override {
        extraEnv = {
          OBS_VKCAPTURE = true;
          RADV_TEX_ANISO = 16;
          PROTON_USE_NTSYNC = 1;
          PROTON_LOCAL_SHADER_CACHE = 1;
          WINE_FULLSCREEN_FSR = 1;
          WINE_FULLSCREEN_FSR_STRENGTH = 2;
        };
      };

      extraCompatPackages = with pkgs; [
        proton-ge-bin
        proton-cachyos
      ];
    };
  };

  jovian = {
    steamos = {
      enableZram = true;
      enableEarlyOOM = true;
    };

    hardware.has.amd.gpu = true;
  };
}
