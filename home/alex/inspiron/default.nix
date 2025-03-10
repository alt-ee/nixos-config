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
    ../features/shell.nix
    ../features/packages.nix
    ../features/cli
    ../features/services.nix
    ../features/desktop
  ];

  options = {
    dotfiles = lib.mkOption {
      type = lib.types.path;
      apply = toString;
      default = "${config.home.homeDirectory}/.dotfiles";
      example = "${config.home.homeDirectory}/.dotfiles";
      description = "Location of the dotiles working copy";
    };
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
      sessionPath = [
        "${config.home.homeDirectory}/bin"
      ];

      file = {
        ".config/nvim/" = {
          source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles}/.config/nvim";
        };

        ".config/i3status/" = {
          source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles}/.config/i3status";
        };
      };
    };

    # Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home.stateVersion = "23.11";
  };
}
