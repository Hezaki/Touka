{ pkgs, ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    historyWidgetOptions = [
      "--sort"
      "--exact"
    ];
  };

  home.packages = with pkgs; [ fzf-git-sh ];
}
