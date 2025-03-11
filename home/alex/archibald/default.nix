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
    ../features/cli
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

  home.stateVersion = "24.11";
}
