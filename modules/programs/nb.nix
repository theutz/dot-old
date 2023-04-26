{ config, lib, pkgs, ... }:
with lib;
{
  options.programs.nb = {
    enable = mkEnableOption "nb, a terminal-based note-taking system";

    package = mkPackageOption pkgs "nb" { };
    bat = mkPackageOption pkgs "bat" { };
    nmap = mkPackageOption pkgs "nmap" { };
    pandoc = mkPackageOption pkgs "pandoc" { };
    ripgrep = mkPackageOption pkgs "ripgrep" { };
    tig = mkPackageOption pkgs "tig" { };
    w3m = mkPackageOption pkgs "w3m" { };
  };

  config =
    let
      cfg = config.programs.nb;
    in
    mkIf cfg.enable
      {
        home.packages = [
          cfg.package
          cfg.bat
          cfg.nmap
          cfg.pandoc
          cfg.ripgrep
          cfg.tig
          cfg.w3m
        ];
      };
}
