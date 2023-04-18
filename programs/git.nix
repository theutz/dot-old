{ config, ... }:
{
    programs.git = {
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
        init.defaultBranch = "main";
      };
    };

}
