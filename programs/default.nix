{ config, ... }:
{
  imports = [
    ./git.nix 
    ./kitty.nix
    ./tmux.nix
    ./vim.nix
    ./zsh.nix
  ];

  programs = {
    home-manager.enable = true;
    oh-my-posh = {
      enable = true;
      useTheme = "night-owl";
    };
    lazygit.enable = true;
    jq.enable = true;
    fzf.enable = true;
    nnn.enable = true;
    lsd = {
      enable =true;
      enableAliases = true;
    };
    gh.enable = true;
    direnv.enable = true;
    zoxide.enable = true;
    bash.enable = true;
    bat.enable = true;
  };
}
