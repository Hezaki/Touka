{ pkgs, ... }:
{
  hardware = {
    amdgpu = {
      overdrive.enable = true;
    };
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };
  };
}
