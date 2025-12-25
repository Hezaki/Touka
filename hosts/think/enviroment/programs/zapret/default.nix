{ inputs, ... }:

{
  imports = with inputs; [ zapret-presets.nixosModules.presets ];

  services.zapret = {
    enable = true;
    sf_presets = {
      enable = true;
      preset = "general_alt2";
    };
  };
}
