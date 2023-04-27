{ config, pkgs, lib, home-manager, ... }:
{
  imports = [ home-manager.darwinModules.home-manager ];

  home-manager = {
    users.michael = ./home.nix;
    extraSpecialArgs = { inherit home-manager; };
  };

  environment.systemPackages = [
    pkgs.vim
    pkgs.pam-reattach
    pkgs.zsh
  ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes) ''
      experimental-features = nix-command flakes
      trusted-users = root michael
    '';
  };

  system = {
    stateVersion = 4;
    patches = [
      (pkgs.writeText "pam.patch" ''
        --- a/etc/pam.d/sudo
        +++ b/etc/pam.d/sudo
        @@ -1,4 +1,6 @@
         # sudo: auth account password session
        +auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so # Needed for using Touch ID within tmux
        +auth       sufficient     pam_tid.so
         auth       sufficient     pam_smartcard.so
         auth       required       pam_opendirectory.so
         account    required       pam_permit.so
      '')
    ];
  };

  users = {
    users = {
      michael = {
        home = /Users/michael;
      };
    };
  };

  programs = { zsh = { enable = true; }; };

  services = {
    nix-daemon.enable = true;
    karabiner-elements.enable = true;
  };
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    taps = [ ];

    brews = [ "asdf" "yadm" ];

    casks = [
      "1password-cli"
      "dash"
      "discord"
      "figma"
      "google-chrome"
      "gpg-suite"
      "helo"
      "httpie"
      "kaleidoscope"
      "keybase"
      "kindle"
      "kitty"
      "loom"
      "ngrok"
      "nordvpn"
      "openvpn-connect"
      "parallels"
      "ray"
      "slack"
      "spotify"
      "surfshark"
      "telegram"
      "tinkerwell"
      "transmit"
      "visual-studio-code"
      "whatsapp"
      "zoom"
    ];

    masApps = {
      "2048 Game" = 871033113;
      "Calendar 366 II" = 1265895169;
      "Ground News" = 1324203419;
      "Kindle" = 405399194;
      "Pixelmator Pro" = 1289583905;
      "Talon" = 1492913323;
      "Tureng" = 854063979;
    };
  };
}
