{ config, pkgs, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [ distrobox podman podman-compose ];
}

