{ lib, ... }:

{
  services.scx = {
    enable = true;
    scheduler = lib.mkForce "scx_cake";

    extraArgs = [
      "-p"
      "esports"
    ];
  };
}
