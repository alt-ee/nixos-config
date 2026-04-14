{
  inputs,
  lib,
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [
    ./packages.nix
    ../features/cli
    ../features/desktop
    ../features/cli/git.nix
    ../features/cli/beets.nix
    ../features/desktop/emacs.nix
  ];

  options = {
    nixfiles = lib.mkOption {
      type = lib.types.path;
      apply = toString;
      default = "${config.home.homeDirectory}/nixos-config";
      example = "${config.home.homeDirectory}/nixos-config";
      description = "Location of nixos config files";
    };
  };

  config = {
    nixpkgs.config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };

    programs.home-manager.enable = true;

    home = {
      username = "alex";
      homeDirectory = "/home/alex";
    };

    nix.gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };

    systemd.user.startServices = "sd-switch";

    home.stateVersion = "24.11";
  };
}
