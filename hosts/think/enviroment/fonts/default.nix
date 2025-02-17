{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-emoji
    ipafont
    lato
    inter
  ];

  console = {
    packages = with pkgs; [ terminus_font ];
    font = "ter-v18n";
    earlySetup = true;
  };
}
