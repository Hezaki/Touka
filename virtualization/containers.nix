{ config, pkgs, lib, inputs, ... }:

{
  home.packages = with pkgs; [ distrobox podman podman-compose ];
}

