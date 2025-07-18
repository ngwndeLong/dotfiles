{
  description = "my first flakes";

  input = {
    nixpkgs = {
      url = "github:Nixos/nixpkgs/nixos-23.05";
    };
  };

  output = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in  {
    nixosConfigurations = {
      nixos-tutorial = lib.nixosSystem {
        inherit system;
        system = "x86_64-linux";
        modules = [ ./configuration.nix
                    home-manager.nixosModules.home-manager {
                      home-manager.useGlobalPkgs = true;
                      home-manager.useUserPackages = true;
                      home-manager.users.scout = import /etc/nixos/home.nix;
                    }
                  ];
      };
  };
}
