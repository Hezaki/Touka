{ inputs, ... }:

{
  imports = with inputs; [
    stasis.homeModules.default
  ];

  services.stasis.enable = true;
}
