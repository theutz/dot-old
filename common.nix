{ config, pkgs, ... }:
{
  imports = [
    ./modules/nb.nix
  ];

  xdg.enable = true;

  xdg.configFile.nvim = {
    source = ./config/neovim;
    recursive = true;
  };

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

  programs.home-manager.enable = true;
  programs.nb.enable = true;

  programs = {
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

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      withNodeJs = true;
      withRuby = true;
      withPython3 = true;
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

    git = {
      enable = true;
      userName = "Michael Utz";
      userEmail = "michael@theutz.dev";
      delta = { enable = true; };
      ignores = [ "*~" "*.swp" "Session.vim" ];
      signing = {
        key = "651A36416AEFB22E";
        signByDefault = true;
      };
      extraConfig = {
        rerere.enabled = true;
        init.defaultBranch = "main";
      };
    };
    kitty = {
      enable = true;
      theme = "Tokyo Night Storm";
      font = {
        name = "Berkeley Mono";
        size = 15;
      };
      keybindings = { };
      settings = {
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
    };
    tmux = {
      enable = true;
      keyMode = "vi";
      mouse = true;
      baseIndex = 1;
      escapeTime = 0;
      disableConfirmationPrompt = true;
      plugins = with pkgs.tmuxPlugins; [
        fuzzback
        extrakto
        pain-control
        sessionist
        resurrect
        vim-tmux-navigator
        {
          plugin = tmux-fzf;
          extraConfig = ''
            TMUX_FZF_LAUNCH_KEY="C-f"
          '';
        }
        (mkTmuxPlugin {
          pluginName = "tmux.nvim";
          version = "unstable-2023-04-15";
          src = pkgs.fetchFromGitHub {
            owner = "aserowy";
            repo = "tmux.nvim";
            rev = "b6da35847df972f50df27d938b6e5ea09bcc8391";
            sha256 = "sha256-QsTuzVfUL7ovK4KWU77giFqYiH5p0RifX+n0lBViu/4";
          };
        })
        (mkTmuxPlugin {
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
      extraConfig = ''
        bind R source-file $HOME/.config/tmux/tmux.conf \; \
          display-message "Reloaded config!"
        bind C-l send-keys C-l
        bind / "popup 'tmux list-keys | fzf'"
      '';
    };
    zsh = {
      enable = true;
      shellAliases = {
        dot = "nvim ~/dot";
        dots = "darwin-rebuild switch --flake ~/dot && exec zsh";
        lg = "lazygit";
        tmuxa = "tmux new-session -A";
        tmuxl = "tmux list-sessions";
      };
      initExtra = ''
        export DIRENV_LOG_FORMAT=
        autoload edit-command-line; zle -N edit-command-line
        bindkey -M vicmd v edit-command-line
      '';

      prezto = {
        enable = true;
        extraModules = [ "attr" "stat" ];
        extraFunctions = [ "zargs" "zmv" ];
        pmodules = [
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
        editor = {
          keymap = "vi";
          dotExpansion = true;
        };
        macOS.dashKeyword = "manpages";
        ssh.identities = [ "id_rsa" "id_ed25519" ];
        syntaxHighlighting = {
          highlighters = [ "main" "brackets" "pattern" "line" "cursor" "root" ];
          pattern = { "rm*-rf*" = "fg=white,bold,bg=red"; };
        };
        terminal = {
          autoTitle = true;
          windowTitleFormat = "%n@%m: %s";
          tabTitleFormat = "%m: %s";
          multiplexerTitleFormat = "%s";
        };
        tmux = {
          autoStartLocal = true;
          defaultSessionName = "main";
        };
        utility.safeOps = true;
      };
    };
  };
}
