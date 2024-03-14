{ inputs, ... }:{
  imports = [
    inputs.stylix.homeManagerModules.stylix 
  ];
  stylix =  {
    autoEnable = true;
    image = ./images/walp.png;
    polarity = "dark";
    targets = {
      gtk.enable = true;
      firefox.enable = true;
      foot.enable = true;
      hyprland.enable = true;
      waybar.enable = true;
    };
  };
} 
