{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.chromium;
    commandLineArgs = [
       "--start-fullscreen"
    ];
    extensions = [
      {
        id = "hfjbmagddngcpeloejdejnfgbamkjaeg";
      } # Vimium-C
    ];
  };
}
