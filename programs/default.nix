{ ... }: {
  imports = [ ./git.nix ./kitty.nix ./tmux.nix ./vim.nix ./zsh.nix ];

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
      enable = true;
      enableAliases = true;
    };

    gh = {
      enable = true;
      # TODO: Make a nix package for github/gh-projects
      extensions = [ ];
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    btop.enable = true;
    htop.enable = true;
    zoxide.enable = true;
    bash.enable = true;
    bat.enable = true;
  };
}
