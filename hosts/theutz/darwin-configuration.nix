{ config, pkgs, lib, home-manager, ... }:
{
  imports = [
    home-manager.darwinModules.home-manager
    ./homebrew.nix
    ./patches.nix
  ];

  home-manager = {
    users.michael = ./home.nix;
    extraSpecialArgs = { inherit home-manager; };
  };

  environment = {
    systemPackages =
      with pkgs; [
        vim
        pam-reattach
      ];
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes) ''
      experimental-features = nix-command flakes
      trusted-users = root michael
    '';
  };

  system = {
    stateVersion = 4;
  };

  users = {
    users.michael = {
      home = /Users/michael;
    };
  };

  programs = {
    zsh.enable = true;
  };

  services = {
    nix-daemon.enable = true;
    karabiner-elements.enable = true;
  };
}
