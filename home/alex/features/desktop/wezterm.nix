{
  pkgs-unstable,
  ...
}:
{
  programs.wezterm = {
    enable = true;
    package = pkgs-unstable.wezterm;
    extraConfig = ''
      	config = wezterm.config_builder()

        config.default_prog = { "fish", "-i" }

        config.audible_bell = "Disabled"
        config.check_for_updates = false

        config.font = wezterm.font("Iosevka Term")
        config.color_scheme = "bm-khold-inverted"
        config.font_size = 13
        config.use_fancy_tab_bar = false
        config.hide_tab_bar_if_only_one_tab = true

        return config
    '';

    colorSchemes = {
      bm-khold-inverted = {
        ansi = [
          "#000000"
          "#974b46"
          "#5f8787"
          "#eceee3"
          "#888888"
          "#999999"
          "#aaaaaa"
          "#c1c1c1"
        ];
        brights = [
          "#333333"
          "#974b46"
          "#5f8787"
          "#eceee3"
          "#888888"
          "#999999"
          "#aaaaaa"
          "#c1c1c1"
        ];
        background = "#000000";
        cursor_bg = "#c1c1c1";
        cursor_border = "#c1c1c1";
        cursor_fg = "#000000";
        foreground = "#c1c1c1";
        selection_bg = "#c1c1c1";
        selection_fg = "#000000";
      };
    };
  };
}
