{ inputs, ... }:
{
  imports = [
    inputs.bonfire.nixosModules.default
  ];

  services.zapret = {
    enable = true;
  };
}
