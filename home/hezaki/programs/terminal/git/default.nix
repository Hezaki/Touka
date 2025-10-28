{
  programs.git = {
    enable = true;
    settings = {
      # userName = "hezaki";
      # userEmail = "email";
      color.ui = true;
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
      difftastic.enable = true;
      aliases = {
        st = "status";
        c = "commit";
        clown = "clone";
      };
    };
  };
}
