{
  lib,
  config,
  ...
}:
{
  imports = [
    ./packages.nix
    ../services/mounts.nix
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
      grobi = {
        enable = true;
        rules = [
          {
            name = "Docked";
            outputs_connected = [
              "eDP-1"
              "DP-2"
            ];
            configure_row = [
              "DP-2"
              "eDP-1"
            ];
            primary = "DP-2";
          }
          {
            name = "Mobile";
            outputs_disconnected = [
              "HDMI-1"
              "DP-1"
              "DP-2"
            ];
            configure_single = "eDP-1";
            primary = true;
          }
        ];
      };
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
