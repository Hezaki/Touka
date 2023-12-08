{ pkgs, ... }:{
  home.packages = with pkgs; [ gtklock ];
  xdg.configFile."gtklock/style.css".text = ''
    window {
      background-image: url("/etc/nixos/home/hezaki/themes/images/wallpaper.png");
    }

    #window-box {
	    padding: 64px;
	    border-radius: 4px;
      box-shadow: 1 1 3 1px #101010;
	    background-color: #1E1E2E;
    }

    #clock-label {
      font-size: 70px;
    }
  '';
}
