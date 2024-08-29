{ pkgs, ... }:
{
  programs.btop = {
    enable = true;
    package = pkgs.btop.override { rocmSupport = true; };
    settings = {
      vim_keys = true;
      base_10_sizes = true;
    };
  };
}
