{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Lato" ]; })
    noto-fonts-emoji
    ipafont
  ];

  console = {
    packages = with pkgs; [ terminus_font ];
    font = "ter-v18n";
    earlySetup = true;
  };
}
