{
  pkgs,
  lib,
  ...
}:
let
  mod = "Mod4";
  refreshi3status = "killall -SIGUSR1 i3status";
in
{
  imports = [
    ./rofi.nix
  ];

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = mod;

      fonts = {
        names = [ "Cozette" ];
        size = 11.0;
      };

      keybindings = lib.mkOptionDefault {
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        "${mod}+q" = "kill";

        "${mod}+space" = "exec rofi -show drun";
        "${mod}+Tab" = ''
          		  exec "rofi -show window -theme-str 'window {width: 50%;}'"
          		'';
        "${mod}+f" = "exec rofi -show filebrowser";
        "${mod}+Shift+f" = "exec i3-sensible-terminal -e yazi";
        "${mod}+t" = "exec i3-sensible-terminal";
        "${mod}+p" = "exec keepmenu -C";
        "${mod}+Escape" = "exec xflock4";

        "${mod}+slash" = "split h";
        "${mod}+backslash" = "split v";

        "${mod}+r" = "mode resize";

        "${mod}+m" = "fullscreen toggle";
        "${mod}+Shift+Return" = "floating toggle";
        "${mod}+Return" = "focus mode_toggle";
        "XF86AudioRaiseVolume" =
          "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && ${refreshi3status}";
        "XF86AudioLowerVolume" =
          "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && ${refreshi3status}";
        "XF86AudioMute" =
          "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && ${refreshi3status}";
        "XF86AudioMicMute" =
          "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && ${refreshi3status}";

        "--release Print" = "exec import -silent clipboard:";
        "--release Control+Print" = "exec import -silent -window root clipboard:";
        "--release Shift+Print" =
          "exec import -silent ~/Pictures/Screenshots/$(date '+%Y-%m-%d-%T')-screenshot.png";
        "--release Control+Shift+Print" =
          "exec import -silent -window root ~/Pictures/Screenshots/$(date '+%Y-%m-%d-%T')-screenshot.png";

        "${mod}+Shift+1" = "move container to workspace number 1, workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2, workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3, workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4, workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5, workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6, workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7, workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8, workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9, workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10, workspace number 10";
      };

      modes = {
        resize = {
          "h" = "resize shrink width 5 px or 5 ppt";
          "j" = "resize grow height 5 px or 5 ppt";
          "k" = "resize shrink height 5 px or 5 ppt";
          "l" = "resize grow width 5 px or 5 ppt";
          "q" = "mode default";
          "Escape" = "mode default";
          "${mod}+r" = "mode default";
        };
      };

      colors = {
        focused = {
          background = "#222222";
          border = "#555555";
          childBorder = "#222222";
          indicator = "#CCCCCC";
          text = "#FFFFFF";
        };
        focusedInactive = {
          background = "#222222";
          border = "#555555";
          childBorder = "#222222";
          indicator = "#CCCCCC";
          text = "#888888";
        };
        unfocused = {
          background = "#222222";
          border = "#333333";
          childBorder = "#222222";
          indicator = "#CCCCCC";
          text = "#FFFFFF";
        };
      };

      gaps = {
        inner = 10;
      };

      bars = [
        {
          statusCommand = "i3status";
          fonts = {
            names = [ "Cozette" ];
            size = 11.0;
          };

          colors = {
            background = "#222222";
            focusedWorkspace = {
              background = "#222222";
              border = "#555555";
              text = "#FFFFFF";
            };
            inactiveWorkspace = {
              background = "#222222";
              border = "#222222";
              text = "#FFFFFF";
            };
          };
        }
      ];
    };
  };
}
