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
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  programs.home-manager.enable = true;

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
