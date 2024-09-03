{
  nix = {
    optimise.automatic = true;
    settings = {
      builders-use-substitutes = true;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  };
}
