{
  nix = {
    optimise.automatic = true;

    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      builders-use-substitutes = true;

      substituters = [
        "https://mirror.yandex.ru/nixos"
        "https://nix-community.cachix.org"
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];

      trusted-users = [
        "root"
        "hezaki"
        "@wheel"
      ];

      experimental-features = [
        "nix-command"
        "flakes"
        # "pipe-operator"
      ];
    };
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  };
}
