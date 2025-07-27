{ pkgs, ... }:
let
  user = "hezaki";
  passroot = "password";
  passuser = "password";
in
{
  users = {
    users = {
      ${user} = {
        isNormalUser = true;
        initialPassword = passuser;
        home = "/home/${user}";
        extraGroups = [
          "wheel"
          "user-with-access-to-virtualbox"
        ];
        shell = pkgs.zsh;
      };

      root = {
        initialPassword = passroot;
        shell = pkgs.zsh;
      };
    };
    groups = {
      uinput.members = [ "hezaki" ];
      input.members = [ "hezaki" ];
    };
  };
}
