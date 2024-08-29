{ inputs, ... }:
{
  imports = with inputs; [ 
    home-manager.nixosModules.home-manager 
  ];

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };
  };
}
