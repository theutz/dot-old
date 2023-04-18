{ nixvim, ... }: {
  imports = [ nixvim.homeManagerModules.nixvim ../../common.nix ];

  xdg.enable = true;

  home = {
    stateVersion = "22.11"; # Please read the comment before changing.

    file = {
      ".config/karabiner/karabiner.json".source = karabiner/karabiner.json;
      ".config/karabiner/assets/complex_modifications".source =
        karabiner/complex_modifications;

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
}
