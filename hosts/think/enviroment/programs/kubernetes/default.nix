{ pkgs, ... }:

{
  # environment.systemPackages = with pkgs; [
  #   kubernetes
  #   kubectl
  # ];

  services.k3s.enable = false;
}
