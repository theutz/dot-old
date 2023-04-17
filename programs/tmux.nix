{ config, pkgs, ... }:
{
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
        {
          plugin = tmux-fzf;
          extraConfig = ''
            TMUX_FZF_LAUNCH_KEY="C-f"
          '';
        }
        {
          plugin = tilish;
          extraConfig = ''
            set -g @tilish-default 'main-vertical'
            set -g @tilish-dmenu 'on'
            set -g @tilish-navigator 'on'

          '';
        }
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
      '';
    };
}
