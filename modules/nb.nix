{ config, lib, pkgs, ... }:
with lib; {
  options.programs.nb = {
    enable = mkEnableOption "nb, a terminal-based note-taking system";

    package = mkPackageOption pkgs "nb" { };
  };

  config = let cfg = config.programs.nb;
  in mkIf cfg.enable { home.packages = [ cfg.package ]; };
}
