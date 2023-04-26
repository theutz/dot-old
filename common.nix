{ config, pkgs, ... }:
{
  imports = [ ./modules/programs/nb.nix ];

  home.stateVersion = "22.11"; # Please read the comment before changing.
  home.sessionVariables.EDITOR = "nvim";
  home.sessionVariables.VISUAL = "nvim";
  home.file.".nbrc".text = ''
    export NB_AUTO_SYNC=1
  '';
  home.packages = [
    pkgs.manix
    pkgs.ripgrep
    pkgs.tree
    pkgs.ranger
    pkgs.tldr
    pkgs.tig
    (pkgs.nerdfonts.override {
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
  xdg.enable = true;
  xdg.configFile.nvim.source = ./config/neovim;
  xdg.configFile.nvim.recursive = true;
  programs.home-manager.enable = true;
  programs.nb.enable = true;
  programs.oh-my-posh.enable = true;
  programs.oh-my-posh.useTheme = "night-owl";
  programs.lazygit.enable = true;
  programs.jq.enable = true;
  programs.fzf.enable = true;
  programs.nnn.enable = true;
  programs.lsd.enable = true;
  programs.lsd.enableAliases = true;
  programs.gh.enable = true;
  # TODO: Make a nix package for github/gh-projects
  programs.gh.extensions = [ ];
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  programs.neovim.viAlias = true;
  programs.neovim.vimAlias = true;
  programs.neovim.withNodeJs = true;
  programs.neovim.withRuby = true;
  programs.neovim.withPython3 = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.broot.enable = true;
  programs.btop.enable = true;
  programs.htop.enable = true;
  programs.zoxide.enable = true;
  programs.bash.enable = true;
  programs.bat.enable = true;
  programs.git.enable = true;
  programs.git.userName = "Michael Utz";
  programs.git.userEmail = "michael@theutz.dev";
  programs.git.delta = { enable = true; };
  programs.git.ignores = [ "*~" "*.swp" "Session.vim" ];
  programs.git.signing.key = "651A36416AEFB22E";
  programs.git.signing.signByDefault = true;
  programs.git.extraConfig = {
    rerere.enabled = true;
    init.defaultBranch = "main";
  };
  programs.kitty.enable = true;
  programs.kitty.theme = "Tokyo Night Storm";
  programs.kitty.font.name = "Berkeley Mono";
  programs.kitty.font.size = 15;
  programs.kitty.keybindings = { };
  programs.kitty.settings = {
    window_border_width = "0.5pt";
    draw_minimal_borders = "no";
    window_margin_width = 0;
    window_padding_width = 3;
    hide_window_decorations = "yes";
    confirm_os_window_close = 0;
    tab_bar_edge = "top";
    tab_bar_margin_width = "10.0";
    tab_bar_margin_height = "10.0 10.0";
    tab_bar_style = "slant";
    tab_bar_align = "right";
    tab_bar_min_tabs = 2;
    background_opacity = "0.9";
    dynamic_background_opacity = "yes";
    shell_integration = "disabled";
    macos_option_as_alt = "both";
  };
  programs.tmux.enable = true;
  programs.tmux.keyMode = "vi";
  programs.tmux.mouse = true;
  programs.tmux.baseIndex = 1;
  programs.tmux.escapeTime = 0;
  programs.tmux.disableConfirmationPrompt = true;
  programs.tmux.plugins = [
    pkgs.tmuxPlugins.fuzzback
    pkgs.tmuxPlugins.extrakto
    pkgs.tmuxPlugins.pain-control
    pkgs.tmuxPlugins.sessionist
    pkgs.tmuxPlugins.resurrect
    pkgs.tmuxPlugins.vim-tmux-navigator
    {
      plugin = pkgs.tmuxPlugins.tmux-fzf;
      extraConfig = ''
        TMUX_FZF_LAUNCH_KEY="C-f"
      '';
    }
    (pkgs.tmuxPlugins.mkTmuxPlugin {
      pluginName = "tmux.nvim";
      version = "unstable-2023-04-15";
      src = pkgs.fetchFromGitHub {
        owner = "aserowy";
        repo = "tmux.nvim";
        rev = "b6da35847df972f50df27d938b6e5ea09bcc8391";
        sha256 = "sha256-QsTuzVfUL7ovK4KWU77giFqYiH5p0RifX+n0lBViu/4";
      };
    })
    (pkgs.tmuxPlugins.mkTmuxPlugin {
      pluginName = "tokyonight";
      version = "unstable-2023-04-17";
      src = pkgs.fetchFromGitHub {
        owner = "theutz";
        repo = "tmux-tokyonight-nvim";
        rev = "207103e4e34c83eab6f06a7789a7569a81beda03";
        sha256 = "sha256-3Lw+d4/qysSOPwL4B9+dhY2JDF60oZAMMt5sW0ND9F0";
      };
      extraConfig = ''
        set -g @tokyonight 'moon'
      '';
    })
  ];
  programs.tmux.extraConfig = ''
    bind R source-file $HOME/.config/tmux/tmux.conf \; \
      display-message "Reloaded config!"
    bind C-l send-keys C-l
    bind / "popup 'tmux list-keys | fzf'"
  '';
  programs.zsh.enable = true;
  programs.zsh.shellAliases = {
    dot = "nvim ~/dot";
    dots = "darwin-rebuild switch --flake ~/dot && exec zsh";
    lg = "lazygit";
    tmuxa = "tmux new-session -A";
    tmuxl = "tmux list-sessions";
  };
  programs.zsh.initExtra = ''
    export DIRENV_LOG_FORMAT=
    autoload edit-command-line; zle -N edit-command-line
    bindkey -M vicmd v edit-command-line
  '';
  programs.zsh.prezto.enable = true;
  programs.zsh.prezto.extraModules = [ "attr" "stat" ];
  programs.zsh.prezto.extraFunctions = [ "zargs" "zmv" ];
  programs.zsh.prezto.pmodules = [
    "environment"
    "terminal"
    "editor"
    "history"
    "directory"
    "spectrum"
    "utility"
    "ssh"
    "homebrew"
    "git"
    "tmux"
    "osx"
    "docker"
    "completion"
    "syntax-highlighting"
    "history-substring-search"
    "autosuggestions"
  ];
  programs.zsh.prezto.editor.keymap = "vi";
  programs.zsh.prezto.editor.dotExpansion = true;
  programs.zsh.prezto.macOS.dashKeyword = "manpages";
  programs.zsh.prezto.ssh.identities = [ "id_rsa" "id_ed25519" ];
  programs.zsh.prezto.syntaxHighlighting.highlighters = [ "main" "brackets" "pattern" "line" "cursor" "root" ];
  programs.zsh.prezto.syntaxHighlighting.pattern = { "rm*-rf*" = "fg=white,bold,bg=red"; };
  programs.zsh.prezto.terminal.autoTitle = true;
  programs.zsh.prezto.terminal.windowTitleFormat = "%n@%m: %s";
  programs.zsh.prezto.terminal.tabTitleFormat = "%m: %s";
  programs.zsh.prezto.terminal.multiplexerTitleFormat = "%s";
  programs.zsh.prezto.tmux.autoStartLocal = true;
  programs.zsh.prezto.tmux.defaultSessionName = "main";
  programs.zsh.prezto.utility.safeOps = true;
}
