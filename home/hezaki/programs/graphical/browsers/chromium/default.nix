{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.chromium;
    extensions = [
      {
        id = "hfjbmagddngcpeloejdejnfgbamkjaeg";
      } # Vimium-C
    ];
  };
}
