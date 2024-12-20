{
  nix = {
    optimise.automatic = true;
    settings = {
      substituters = [
        "https://cache.garnix.io"
      ];
      trusted-public-keys = [
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
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
