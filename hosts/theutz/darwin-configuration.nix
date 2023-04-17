{ config, pkgs, ... }:
{
  environment = {
    systemPackages =
      with pkgs; [
        vim
      ];
  };

  nix.package = pkgs.nixFlakes;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  users = {
    users.michael = {
      home = /Users/michael;
    };
  };

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
    };

    taps = [ ];
    brews = [
      "asdf"
      "yadm"
    ];
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

  programs = {
    zsh.enable = true;
  };

  services = {
    nix-daemon.enable = true;
    karabiner-elements.enable = true;
  };
}
