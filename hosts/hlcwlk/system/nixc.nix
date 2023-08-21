{ config, outputs, inputs, ... }: {
  nix = {
    settings = {
      trusted-users = [ 
        "username"
        "root"
      ];
      trusted-substituters = [
        "https://nyx.chaotic.cx"
      ];
      extra-trusted-substituters = [
        "https://nyx.chaotic.cx"
      ];
      substituters = [ 
        "https://hyprland.cachix.org"
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
        "https://nyx.chaotic.cx"
        "https://nix-gaming.cachix.org"
      ];
      trusted-public-keys = [
        "nyx.chaotic.cx-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
      extra-trusted-public-keys = [
        "nyx.chaotic.cx-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      ];
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "openssl-1.1.1u"
      ];
      overlays = [
        outputs.overlays.default
        inputs.nur.overlay.default
        inputs.chaotic.overlays.default
      ];
    };
  };
}
