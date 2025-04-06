{ pkgs, ... }:
{
  imports = [
    ./nh
    ./kanata
    ./nix-ld
  ];

  environment = {
    enableDebugInfo = true;
    systemPackages = with pkgs; [
      nix-tree
      p7zip
      unrar
      unzip
      vim
      wget
    ];
  };

  documentation = {
    enable = true;
    man.enable = true;
    doc.enable = false;
    dev.enable = false;
  };

  virtualisation = {
    podman.enable = true;
    libvirtd.enable = true;
    waydroid.enable = true;
    spiceUSBRedirection.enable = true;
  };

  services.fwupd.enable = true;

  programs = {
    zsh.enable = true;
    adb.enable = true;
    dconf.enable = true;
    light.enable = true;
    gamescope.enable = true;
    gamemode.enable = true;
    virt-manager.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
    steam = {
      enable = true;
      package = pkgs.steam.override {
        extraEnv = {
          OBS_VKCAPTURE = true;
          RADV_TEX_ANISO = 16;
        };
        extraLibraries =
          p: with p; [
            atk
          ];
      };
      gamescopeSession.enable = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
