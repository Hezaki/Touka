{
  nix = {
    optimise.automatic = true;
    settings = {
      warn-dirty = false;

      # substituters = [
      #   "https://cache.garnix.io"
      # ];
      # trusted-public-keys = [
      #   "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      # ];
      extra-substituters = [
        "https://anyrun.cachix.org"
      ];

      extra-trusted-public-keys = [
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      ];
      trusted-users = [
        "root"
        "hezaki"
        "@wheel"
      ];
      builders-use-substitutes = true;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  };
}
