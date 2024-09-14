{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    noto-fonts-emoji
    ipafont
    lato
  ];

  console = {
    packages = with pkgs; [ terminus_font ];
    font = "ter-v18n";
    earlySetup = true;
  };
}
