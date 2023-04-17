{ config, lib, pkgs, nixvim, nix-colors, ... }:
{
  imports = [
    nixvim.homeManagerModules.nixvim
    nix-colors.homeManagerModule
  ];

  colorScheme = nix-colors.colorSchemes.dracula;

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
      theme = config.colorScheme.name;
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

    lsd = {
      enable =true;
      enableAliases = true;
    };

    gh.enable = true;

    direnv.enable = true;

    zoxide.enable = true;

    bash.enable = true;

    bat.enable = true;

    git = {
      enable = true;
      userName = "Michael Utz";
      userEmail = "michael@theutz.dev";
      delta = {
        enable = true;
      };
      ignores = [
        "*~"
        "*.swp"
      ];
      signing = {
        key = "651A36416AEFB22E";
        signByDefault = true;
      };
      extraConfig = {
        rerere.enabled = true;
      };
    };

    nixvim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      editorconfig.enable = true;
      colorschemes.base16 = {
        enable =true;
        useTruecolor = true;
        colorscheme = lib.toLower config.colorScheme.name;
      };
      globals = {
        mapleader = " ";
      };
      maps = {
        normal = {
          "<leader><space>" = { action = "<cmd>Telescope find_files<cr>"; desc = "Find files"; };
          "<leader>fs" = { action = "<cmd>w<cr>"; desc = "Save file"; };
          "<leader>fe" = { action = "NvimTree<cr>"; desc = "Open file explorer"; };
          "<leader>gg" = { action = "<cmd>Neogit<cr>"; desc = "Git Status"; };
          "<leader>qq" = { action = "<cmd>wq<cr>"; desc = "Write and quit"; } ;
          "<leader>qs" = { action = "<cmd>SSave!<cr>"; desc = "Save session"; } ;
          "<leader>qx" = { action = "<cmd>SDelete!<cr>"; desc = "Delete session"; };
        };
      };
      options = {
        number = true;
        relativenumber = true;
        shiftwidth = 2;
        tabstop = 2;
        expandtab = true;
      };
      plugins = {
        surround.enable = true;
        which-key = {
          enable = true;
        };
        emmet.enable = true;
        gitsigns.enable = true;
        neogit.enable = true;
        nvim-tree.enable = true;
        commentary.enable = true;
        telescope.enable = true;
        floaterm.enable = true;
        vim-matchup.enable = true;
        startify = {
          enable =true;
          enableSpecial = true;
          sessionPersistence = true;
          sessionAutoload = true;
        };
        tmux-navigator.enable = true;
        treesitter.enable = true;
      };
    };
  };
}
