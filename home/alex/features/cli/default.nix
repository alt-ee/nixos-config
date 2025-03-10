{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./helix.nix
    ./yazi.nix
  ];

  programs = {
    zellij.enable = true;
    lazygit.enable = true;
    git.enable = true;
    zoxide.enable = true;

    zk = {
      enable = true;
      settings = {
        notebook.dir = "~/Documents/notes";
      };
    };

    zathura = {
      enable = true;
      options = {
        font = "cozette";
      };
    };

    man = {
      enable = true;
      generateCaches = true;
    };

    rofi = {
      enable = true;
      extraConfig = {
        drun-display-format = "{name}";
      };
      theme = "${config.dotfiles}/.config/rofi/theme.rasi";
    };
  };
}
