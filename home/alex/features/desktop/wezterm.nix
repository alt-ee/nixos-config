{
  ...
}:
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      	local config = wezterm.config_builder()
      	local act = wezterm.action

        config.default_prog = { "fish", "-i" }

        config.audible_bell = "Disabled"
        config.check_for_updates = false

        config.font = wezterm.font("Iosevka")
        config.color_scheme = "bm-khold-inverted"
        config.font_size = 13
        config.use_fancy_tab_bar = false
        config.hide_tab_bar_if_only_one_tab = true

        config.command_palette_font = wezterm.font("Iosevka")
        config.command_palette_font_size = 13

        config.disable_default_key_bindings = true
        config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 }
        config.keys = {
          {
            mods = "LEADER",
            key = "s",
            action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
          },
          {
            mods = "LEADER",
            key = "d",
            action = act.SplitVertical { domain = 'CurrentPaneDomain' }
          },
          {
            mods = "LEADER",
            key = "t",
            action = act.SpawnTab('CurrentPaneDomain')
          },
          {
            mods = "LEADER",
            key = "w",
            action = act.CloseCurrentTab { confirm = true }
          },
          {
            mods = "LEADER",
            key = "Tab",
            action = act.ActivateTabRelative(1)
          },
          {
            mods = "LEADER|SHIFT",
            key = "Tab",
            action = act.ActivateTabRelative(-1)
          },
          {
            mods = "LEADER",
            key = "Space",
            action = act.ActivateCommandPalette
          },
          {
            mods = "ALT",
            key = "h",
            action = act.ActivatePaneDirection 'Left'
          },
          {
            mods = "ALT",
            key = "j",
            action = act.ActivatePaneDirection 'Down'
          },
          {
            mods = "ALT",
            key = "k",
            action = act.ActivatePaneDirection 'Up'
          },
          {
            mods = "ALT",
            key = "l",
            action = act.ActivatePaneDirection 'Right'
          }          
        }

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
