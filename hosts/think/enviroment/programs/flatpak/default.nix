{ inputs, ... }:
{
  imports = with inputs; [ nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak = {
    enable = true;

    packages = [
      "pw.mmk.OpenFreebuds"
    ];
  };
}
