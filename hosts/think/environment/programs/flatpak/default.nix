{ inputs, ... }:
{
  imports = with inputs; [ nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak = {
    enable = true;

    packages = [ "com.pojtinger.felicitas.Multiplex" ];
  };
}
