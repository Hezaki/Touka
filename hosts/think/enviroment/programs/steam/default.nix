{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    gamescopeSession = {
      enable = true;
      args = [
        "--threaded-rendering"
        "--adaptive-sync"
        "--rt"
        "--steam"
        "-e"
        "-f"
      ];
    };
    platformOptimizations.enable = true;
  };
}
