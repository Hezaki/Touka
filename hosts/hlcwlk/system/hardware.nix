{ pkgs, ... }:
{
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
        amdvlk
        libvdpau-va-gl
        vaapiVdpau
        libdrm
      ];
    };
    bluetooth.enable = true;
    pulseaudio.enable = false;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  xdg.portal = {
    enable = true;
    configPackages = [ pkgs.gnome.gnome-session ];
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
