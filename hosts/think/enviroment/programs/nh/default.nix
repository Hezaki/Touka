{ inputs, ... }:

{
  # imports = with inputs; [ nixos-cli.nixosModules.nixos-cli ];
  #
  # programs.nixos-cli = {
  #   enable = true;
  #   settings = {
  #     config_location = "/home/hezaki/.config/nixos-touka/";
  #     apply = {
  #       reexec_as_root = true;
  #       use_nom = true;
  #     };
  #   };
  # };

  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "/home/hezaki/.config/nixos-touka/";
  };
}
