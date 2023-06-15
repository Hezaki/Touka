{ pkgs, ... }:

{
  home.packages = with pkgs; with python311Packages; [
    python311 
    pip
  ];
}

