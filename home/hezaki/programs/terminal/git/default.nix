{
  programs.git = {
    enable = true;
    userName  = "hezaki";
    userEmail = "email";
    difftastic.enable = true;
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
    aliases = {
      s = "status";
      c = "commit";
    };
  };
}
