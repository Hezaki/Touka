{ inputs, config, ... }:
let
  path = "/home/hezaki/.config";
in
{
  imports = with inputs; [ sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = ../../../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "${path}/sops/age/keys.txt";

    secrets = {
      "github_token" = { };
    };
  };

  systemd.services.gh = {
    script = ''
      export GITHUB_TOKEN=$(cat ${config.sops.secrets."github_token".path})
    '';

    serviceConfig = {
      Type = "oneshot";
    };
  };
}
