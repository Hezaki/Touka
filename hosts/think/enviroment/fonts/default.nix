{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    ipafont
    inter
    google-fonts
  ];

  console = {
    keyMap = "us";
    earlySetup = true;
  };
}
