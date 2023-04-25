{ config, ... }:
{
  imports = [
    ./programs/default.nix
  ];

  xdg.enable = true;
  xdg.configFile = {
    nvim = {
      source = ./config/neovim;
      recursive = true;
    };
  };

}
