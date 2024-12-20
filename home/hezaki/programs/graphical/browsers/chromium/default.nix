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
        id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
      } # Ublock Origin
      {
        id = "hfjbmagddngcpeloejdejnfgbamkjaeg";
      } # Vimium-C
      {
        id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
      } # Dark reader
      {
        id = "pfpolingmjapeepkjhnimfaofmlhhfbf";
      } # Youboost
    ];
  };
}
