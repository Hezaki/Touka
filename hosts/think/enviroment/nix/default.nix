{ inputs, ... }:

{
  imports = with inputs; [ determinate.nixosModules.default ];

  nix = {
    optimise.automatic = true;
    daemonCPUSchedPolicy = "idle";

    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      builders-use-substitutes = true;

      substituters = [
        "https://mirror.yandex.ru/nixos"
        "https://install.determinate.systems"
        "https://cache.garnix.io"
        "https://ayugram-desktop.cachix.org"
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "ayugram-desktop.cachix.org:AZ5EqHrJsAKL5YkZYLPEsb1FdD9QlypUwQ0REcJftgA="
      ];

      trusted-users = [
        "root"
        "hezaki"
        "@wheel"
      ];

      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
    };
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  };
}
