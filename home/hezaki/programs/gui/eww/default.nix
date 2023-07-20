{ config, pkgs, inputs, ... }: {
  home.file = {
    ".config/eww/eww.scss".source = ./eww.scss;
    ".config/eww/eww.yuck".source = ./eww.yuck;
    ".config/eww/scripts".source = ./scripts;
  };
}
