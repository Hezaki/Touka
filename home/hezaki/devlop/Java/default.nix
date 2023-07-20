{ pkgs, ... }: {
  home.packages = with pkgs; [
    openjdk8-bootstrap
  ];
}

