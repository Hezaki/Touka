{ inputs, ... }:
{
  imports = with inputs; [ bluevein.nixosModules.default ];

  services.bluevein = {
    enable = true;
    # efiDevice = "/dev/disk/by-uuid/A1B2-C3D4";
  };
}
