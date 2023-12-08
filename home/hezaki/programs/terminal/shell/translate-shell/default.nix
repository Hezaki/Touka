{ pkgs, ... }:{
  home.packages = with pkgs; [ translate-shell ];
  xdg.configFile."translate-shell/init.trans".text = ''
    {
      :verbose         false
      :indent          2
      :hl              "ru"
      :tl              ["en" "ru"]
      :engine          "google"
      :theme           "random"
    }
  '';
}
