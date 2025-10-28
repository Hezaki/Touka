{ inputs, ... }:
{
  imports = with inputs; [
    zen-browser.homeModules.beta
  ];

  programs.zen-browser.enable = true;
}
