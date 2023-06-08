{ config, pkgs, inputs, ... }:

{
  services.xserver.videoDrivers = [
  "amdgpu"
  "radeon"
 ];

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
  };

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    jetbrains-mono
    # ipafont
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  imports = [
    ./pipewire.nix
    ./variables.nix
  ];
}
