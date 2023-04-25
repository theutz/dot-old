{ ... }: {
  imports = [ ../../common.nix ];

  home.stateVersion = "22.11"; # Please read the comment before changing.

  xdg.configFile = {
    "karabiner/karabiner.json" = {
      source = ./karabiner.json;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
