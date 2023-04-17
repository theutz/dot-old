{ config, lib, pkgs, nixvim, ... }:
{
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

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
        (mkTmuxPlugin {
          pluginName = "tokyo-night";
          version = "unstable-2023-04-17";
          src = pkgs.fetchFromGitHub {
            owner = "theutz";
            repo = "tmux-tokyonight-nvim";
            rev = "207103e4e34c83eab6f06a7789a7569a81beda03";
            sha256 = "sha256-3Lw+d4/qysSOPwL4B9+dhY2JDF60oZAMMt5sW0ND9F0";
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
        "Session.vim"
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
      globals = {
        mapleader = " ";
      };
      maps = let
        clearSearchWithEscape = { action = "<cmd>noh<cr><esc>"; desc = "Escape and clear hlsearch"; };
      in {
        normal = let
          findFiles = { action = "<cmd>Telescope find_files<cr>"; desc = "Find files"; };
          searchInFiles = { action = "<cmd>Telescope grep_string<cr>"; desc = "Search in files"; };
          openTerminal = { action = "<cmd>FloatermToggle<cr>"; desc = "Open terminal"; };
        in {
          "<esc>" = clearSearchWithEscape;
          "<leader><space>" = findFiles;
          "<leader>/" = searchInFiles;
          "<leader>fe" = { action = "<cmd>Neotree<cr>"; desc = "Open file explorer"; };
          "<leader>ff" = findFiles;
          "<leader>fs" = { action = "<cmd>w<cr>"; desc = "Save file"; };
          "<leader>gg" = { action = "<cmd>FloatermNew --wintype=float --width=0.9 --height=0.9 lazygit<cr>"; desc = "Git Status"; };
          "<leader>ot" = openTerminal;
          "<leader>qq" = { action = "<cmd>wq<cr>"; desc = "Write and quit"; } ;
          "<leader>qs" = { action = "<cmd>Obsession<cr>"; desc = "Toggle session tracking"; } ;
          "<leader>qx" = { action = "<cmd>Obsession!<cr>"; desc = "Delete session"; };
          "<leader>sp" = searchInFiles;
        };
        insert = {
          "<esc>" = clearSearchWithEscape;
        };
        terminal = {
          "<esc><esc>" = { action = "<c-\\><c-n>"; desc = "Enter normal mode"; };
        };
      };
      options = {
        number = true;
        relativenumber = true;
        shiftwidth = 2;
        tabstop = 2;
        expandtab = true;
      };
      colorschemes = {
        tokyonight = {
          enable = true;
        };
      };
      plugins = {
        surround.enable = true;
        which-key = {
          enable = true;
        };
        lualine = {
          enable = true;
        };
        emmet.enable = true;
        fugitive.enable = true;
        gitsigns.enable = true;
        neo-tree.enable = true;
        commentary.enable = true;
        telescope.enable = true;
        floaterm = {
          enable = true;
          autoclose = 1; # keep open for non-zero exit code
          autoinsert = true;
          giteditor = true;
          height = 10;
          wintype = "split";
        };
        vim-matchup = {
          enable = true;
          matchParen.enable = true;
        };
        nvim-autopairs = {
          enable = true;
        };
        null-ls = {
          enable = true;
        };
        treesitter.enable = true;
      };
      extraPlugins = with pkgs.vimPlugins; [
        tmux-nvim
        vim-obsession
        vim-sensible
      ];
      extraConfigLuaPre = ''
      '';
      extraConfigLua = ''
        require('tmux').setup()
      '';
      extraConfigLuaPost = ''
      '';
    };
  };
}
