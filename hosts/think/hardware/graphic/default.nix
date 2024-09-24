{ pkgs, ... }:
{
  hardware = {
    amdgpu.amdvlk.enable = true;
    graphics = {
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        vaapiVdpau
        libvdpau-va-gl
      ];
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };
  };
}
