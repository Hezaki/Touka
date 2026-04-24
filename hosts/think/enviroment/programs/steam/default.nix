{
  pkgs,
  inputs,
  config,
  ...
}:

{
  imports = with inputs; [
    jovian-steamdeck.nixosModules.default
    lsfg-vk-flake.nixosModules.default
  ];

  programs.steam = {
    enable = true;
    protontricks.enable = true;
    platformOptimizations.enable = true;

    package = pkgs.steam.override {
      extraEnv = {
        OBS_VKCAPTURE = true;
        RADV_TEX_ANISO = 16;
        PROTON_USE_NTSYNC = 1;
        DXVR_ASYNC = 1;
        PROTON_LOCAL_SHADER_CACHE = 1;
        WINE_FULLSCREEN_FSR = 1;
        WINE_FULLSCREEN_FSR_STRENGTH = 2;
      };
    };

    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };

  jovian = {
    steam.enable = true;

    decky-loader = {
      enable = true;
      user = "hezaki";
    };

    steamos.useSteamOSConfig = true;

    hardware = {
      amd.gpu = {
        enableEarlyModesetting = true;
        enableBacklightControl = true;
      };

      has.amd.gpu = true;
    };

    devices.steamdeck = {
      enableOsFanControl = true;
      enablePerfControlUdevRules = true;
      enableVendorDrivers = true;
    };
  };

  systemd.tmpfiles.settings."steam-cef-remote-debugging"."${config.users.users.hezaki.home}/.local/share/Steam/.cef-enable-remote-debugging".f =
    {
      user = "hezaki";
      group = "users";
    };

  services.lsfg-vk = {
    enable = true;
    ui.enable = true;
  };
}
