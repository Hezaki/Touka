{
  security = {
    doas = {
      enable = true;
      extraConfig = ''
        permit persist keepenv :wheel
        permit nopass hezaki as root cmd light
      '';
    };
    sudo.enable = false;
  };
}
