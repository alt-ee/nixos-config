{
  config,
  ...
}:
{
  programs.rofi = {
    enable = true;
    extraConfig = {
      drun-display-format = "{name}";
    };
    theme = "${config.dotfiles}/.config/rofi/theme.rasi";
  };
}
