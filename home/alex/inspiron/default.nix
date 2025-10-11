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
    ../features/cli/man.nix
    ../features/desktop
    ../features/desktop/i3.nix
    ../features/cli/beets.nix
    ../features/creativity/reaper.nix
    ../features/desktop/emacs.nix
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

    programs.info.enable = true;

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

      sessionVariables = {
        TERMINAL = "wezterm";
      };

      shellAliases = {
        cnix = "cd ${config.nixfiles}";
        switchhome = "cnix && home-manager switch --flake .#alex@inspiron";
        switchnix = "cnix && sudo nixos-rebuild switch --flake .#inspiron";

        t = "todo.sh";
      };

    };

    services = {
      xsettingsd.enable = true;
    };

    xdg.desktopEntries = {
      # renoise = {
      #   name = "Renoise";
      #   genericName = "Music Tracker";
      #   type = "Application";
      #   categories = [
      #     "AudioVideo"
      #     "Audio"
      #   ];
      #   exec = "pw-jack renoise";
      #   terminal = false;
      #   mimeType = [
      #     "application/x-renoise-module"
      #     "application/x-renoise-rns-module"
      #   ];
      # };
    };

    # Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home.stateVersion = "23.11";
  };
}
