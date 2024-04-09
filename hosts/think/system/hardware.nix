{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    libva
    libva-utils
    mesa
  ];

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
	intel-media-driver
      	amdvlk
      	libvdpau-va-gl
        vaapiVdpau
        libdrm
      ];
    };
    bluetooth.enable = true;
    pulseaudio.enable = false;
    system76.enableAll = true;
  };

  security.rtkit.enable = true;
  services = {
    irqbalance.enable = true;
    fstrim.enable = true;
    dbus.implementation = "broker";
    system76-scheduler = { 
      enable = true;
      settings = {
        cfsProfiles.enable = true;
        processScheduler.pipewireBoost.enable = true;
      };
    };
    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };
    upower = {
      enable = true;
      percentageCritical = 15;
    };
    tlp = { 
      enable = true;
      settings = {
        INTEL_GPU_MIN_FREQ_ON_AC=400;
        INTEL_GPU_MIN_FREQ_ON_BAT=400;
      };
    };
    pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };

  xdg.portal = {
    enable = true;
    configPackages = [ pkgs.xdg-desktop-portal-wlr ];
    wlr = {
      enable = true;
      settings = {
        screencast = {
          chooser_type = "simple";
        };
      };
    };
  };
}
