{ pkgs, ... }: {
  imports = [ ./git.nix ./kitty.nix ./tmux.nix ./vim.nix ./zsh.nix ];

  home.packages = with pkgs; [
    manix
    ripgrep
    tree
    ranger
    tldr
    tig
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "Hack"
        "Hasklig"
        "RobotoMono"
        "SourceCodePro"
        "IBMPlexMono"
      ];
    })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
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

    broot.enable = true;
    btop.enable = true;
    htop.enable = true;
    zoxide.enable = true;
    bash.enable = true;
    bat.enable = true;
  };
}
