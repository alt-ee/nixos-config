{
  config,
  pkgs,
  ...
}:
{
  home.packages = (
    with pkgs;
    [
      rofi-power-menu
    ]
  );

  programs.rofi = {
    enable = true;
    extraConfig = {
      drun-display-format = "{name}";
    };
    theme = "${config.dotfiles}/.config/rofi/theme.rasi";
  };
}
