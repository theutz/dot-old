{ config, pkgs, ... }:
{
  environment = {
    systemPackages =
      with pkgs; [
        vim
      ];
  };

  nix.package = pkgs.nix;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

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
