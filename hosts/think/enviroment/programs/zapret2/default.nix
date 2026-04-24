{ inputs, ... }:

{
  imports = with inputs; [ zapret2.nixosModules.default ];

  services.zapret2.enable = true;
}
