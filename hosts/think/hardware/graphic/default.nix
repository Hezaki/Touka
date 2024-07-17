{ pkgs, ... }: {
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-compute-runtime
        vaapiVdpau
        intel-vaapi-driver
      	libvdpau-va-gl
        libdrm
        libva
      ];
    };
  };
}
