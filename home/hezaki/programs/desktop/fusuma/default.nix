{ pkgs, ... }:
{
  home.packages = with pkgs; [ fusuma ];
  xdg.cacheFile."fusuma/config.yml".text = # yml
    ''
      swipe:
        4:
          up:
            command: "sh $XDG_CONFIG_HOME/hypr/scripts/defSreenshot.sh"
          down:
            command: "sh $XDG_CONFIG_HOME/hypr/scripts/defSreenshot.sh"
    '';
}
