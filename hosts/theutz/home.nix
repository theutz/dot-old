{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  #home.username = "michael";
  #home.homeDirectory = "/Users/michael";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/michael/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = rec {
      hm = "home-manager";
      hms = "${hm} switch";
      hme = "${hm} edit";
      dr = "darwin-rebuild";
      drs = "${dr} switch";
      dre = "${dr} edit";
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

  programs.oh-my-posh = {
    enable = true;
    useTheme = "night-owl";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.lazygit.enable = true;

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      fuzzback
      nord
      extrakto
      pain-control
      sessionist
      resurrect
      tmux-fzf
      vim-tmux-focus-events
      vim-tmux-navigator
    ];
    extraConfig = ''
      TMUX_FZF_LAUNCH_KEY="C-f"
    '';
  };

  programs.jq.enable = true;
  programs.fzf.enable = true;
  programs.kitty = {
    enable = true;
    theme = "Grape";
    font = {
      name = "Berkeley Mono";
      size = 17;
    };
    keybindings = { };
    settings = {
      window_border_width = "0.5pt";
      draw_minimal_borders = "no";
      window_margin_width = 6;
      window_padding_width = 6;
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

  programs.lsd.enable = true;
}
