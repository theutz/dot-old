{ config, ... }:
{
    programs.zsh = {
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
}
