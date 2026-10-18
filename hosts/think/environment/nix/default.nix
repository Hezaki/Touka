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
      max-jobs = "auto";
      cores = 0;

      substituters = [
        "https://cache.nixos.org"
        "https://noctalia.cachix.org"
        "https://mirror.yandex.ru/nixos"
        "https://install.determinate.systems"
        "https://ayugram-desktop.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
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
}
