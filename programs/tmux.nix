{ config, pkgs, ... }: {
  programs.tmux = {
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
    '';
  };
}
