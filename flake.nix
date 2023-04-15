{
  description = "Dot: a bespoke collection of system configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devenv.url = "github:cachix/devenv/latest";
  };

  outputs = { self, nixpkgs, darwin, home-manager, devenv, ... }: {
    darwinConfigurations."theutz" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./hosts/theutz/darwin-configuration.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.michael = import ./hosts/theutz/home.nix;
        }
      ];
      inputs = { inherit devenv darwin nixpkgs; };
    };
  };
}
