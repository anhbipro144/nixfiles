{
  description = "Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen.url = "path:./zen";
  };

  outputs = { nixpkgs, home-manager, zen, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      hm = home-manager.lib.homeManagerConfiguration;

      zenBrowser = zen.packages.${system}.zen-browser;
    in {
      homeConfigurations = {
        neo = hm {
          inherit pkgs;

          extraSpecialArgs = { inherit zenBrowser; };

          modules =
            [ ./home.nix ./modules/packages.nix ./modules/programs.nix ];
        };
      };
    };
}
