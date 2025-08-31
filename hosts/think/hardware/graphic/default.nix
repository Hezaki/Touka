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
        vaapiVdpau
        libvdpau-va-gl
      ];
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };
  };
}
