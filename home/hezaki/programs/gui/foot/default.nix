{ config, pkgs, ... }: {
 programs.foot = {
  enable = true;
  server.enable = false;
  settings = {
   main = {
    app-id = "Terminal";
    title = "Terminal";
    font = "JetBrainsMono NerdFont:Medium:size=10";
   };
   colors = {
    foreground = "cdd6f4";
    background = "1e1e2e";
    regular0 = "45475a";
    regular1 = "f38ba8";
    regular2 = "a6e3a1";
    regular3 = "f9e2af";
    regular4 = "89b4fa";
    regular5 = "f5c2e7";
    regular6 = "94e2d5";
    regular7 = "bac2de";
   };
  };
 };
}
