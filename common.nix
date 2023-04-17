{ config, ... }:
{
  imports = [
    ./programs/zsh.nix
    ./programs/tmux.nix
  ];
}
