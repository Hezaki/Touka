{
  programs.git = {
    enable = true;
    userName = "hezaki";
    userEmail = "email";
    difftastic.enable = true;
    extraConfig = {
      color.ui = true;
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
    aliases = {
      st = "status";
      c = "commit";
      clown = "clone";
    };
  };
}
