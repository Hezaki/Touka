{ lib, pkgs, user, ... }:

{
  home.file."/home/hezaki/.config/nvim/init.lua".source = ./nvim/init.lua;
  home.file."/home/hezaki/.config/nvim/lua".source = ./nvim/lua;
}
