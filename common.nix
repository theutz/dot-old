{ config, ... }:
{
  imports = [
    ./programs/zsh.nix
    ./programs/tmux.nix
    ./programs/kitty.nix
    ./programs/git.nix
    ./programs/vim.nix
  ];
}
