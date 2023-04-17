{ config, pkgs, nixvim, ... }:

{
  xdg.enable = true;

  home = {
    stateVersion = "22.11"; # Please read the comment before changing.

    packages = with pkgs; [
      manix
      ripgrep
      tree
      ranger
      tldr
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

    file = {
      ".config/karabiner/karabiner.json".source = karabiner/karabiner.json;
      ".config/karabiner/assets/complex_modifications".source = karabiner/complex_modifications;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  programs = {
    home-manager.enable = true;

    zsh = {
      enable = true;
      shellAliases = rec {
        dot = "nvim ~/dot";
        dots = "darwin-rebuild switch --flake ~/dot && exec zsh";
        lg = "lazygit";
        tmuxa = "tmux new-session -A";
        tmuxl = "tmux list-sessions";
      };

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
        ssh.identities = [
          "id_rsa"
          "id_ed25519"
        ];
        syntaxHighlighting = {
          highlighters = [ "main" "brackets" "pattern" "line" "cursor" "root" ];
          pattern = {
            "rm*-rf*" = "fg=white,bold,bg=red";
          };
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

    oh-my-posh = {
      enable = true;
      useTheme = "night-owl";
    };

    lazygit.enable = true;

    tmux = {
      enable = true;
      keyMode = "vi";
      mouse = true;
      baseIndex = 1;
      escapeTime = 0;
      disableConfirmationPrompt = true;
      plugins = with pkgs.tmuxPlugins; [
        fuzzback
        nord
        extrakto
        pain-control
        sessionist
        resurrect
        tmux-fzf
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
      ];
      extraConfig = ''
        TMUX_FZF_LAUNCH_KEY="C-f"
      '';
    };

    jq.enable = true;

    fzf.enable = true;

    kitty = {
      enable = true;
      theme = "Grape";
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
        background_opacity = "1.0";
        dynamic_background_opacity = "yes";
        shell_integration = "disabled";
        macos_option_as_alt = "both";
      };
    };

    nnn.enable = true;

    lsd.enable = true;

    gh.enable = true;

    direnv.enable = true;

    zoxide.enable = true;

    bash.enable = true;

    bat.enable = true;

    nixvim = {
      enable = true;
      colorschemes.gruvbox.enable = true;
      options = {
        number = true;
        relativenumber = true;
        shiftwidth = 2;
        tabstop = 2;
        expandtab = true;
      };
    };
  };
}
