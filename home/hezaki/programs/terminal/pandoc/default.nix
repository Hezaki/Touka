{
  programs.pandoc = {
    enable = true;
    defaults = {
      pdf-engine = "tectonic";
    };
  };
}
