{ config, pkgs, ... }:

{
 programs.foot = {
  enable = true;
  server.enable = false;
  settings = {
   main = {
    app-id = "Terminal";
    title = "Terminal";
    font = "JetBrainsMono NerdFont:Medium:size=10";
    initial-window-size-pixels = "1000x600";
   };
   colors = {
    foreground = "ebdbb2";
    background = "1d2021";
    regular0 = "282828";
    regular1 = "cc241d";
    regular2 = "98971a";
    regular3 = "d79921";
    regular4 = "458588";
    regular5 = "b16286";
    regular6 = "689d6a";
    regular7 = "a89984";
   };
  };
 };
}
