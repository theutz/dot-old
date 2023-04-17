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
    nixvim = {
      url = "github:pta2002/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, darwin, home-manager, nixvim, nix-colors, ... }: {
    darwinConfigurations."theutz" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [./hosts/theutz/darwin-configuration.nix];
      specialArgs = { inherit nixvim nix-colors home-manager; };
    };
  };
}
