{
  description = "Dot: a bespoke collection of system configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, darwin }: {
    darwinConfigurations."theutz" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./hosts/theutz/darwin-configuration.nix
      ];
      inputs = { inherit darwin nixpkgs; };
    };
  };
}
