{ pkgs, ... }: {
  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
      	libvdpau-va-gl
        libdrm
        libva
      ];
    };
    bluetooth.enable = true;
    pulseaudio.enable = false;
    system76.enableAll = true;
    uinput.enable = true;
  };

  security.rtkit.enable = true;
  services = {
    ollama.enable = true;
    ratbagd.enable = true;
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
      percentageLow = 15;
      usePercentageForPolicy = true;
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

  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = "performance";
  };
}
