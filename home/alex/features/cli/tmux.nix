{
  pkgs,
  config,
  ...
}:
{
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    historyLimit = 50000;
    keyMode = "vi";
    shortcut = "Space";
    sensibleOnTop = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "screen-256color";

    extraConfig = ''
      unbind -a
      bind r source-file ${config.xdg.configHome}/tmux/tmux.conf
      bind s split-window -h
      bind d split-window -v
      bind x kill-pane
      bind z detach-client
      bind l choose-tree -s
      bind , command-prompt -I'#W' { rename-window -- '%%' }

      bind -n M-\; command-prompt

      bind -n M-h select-pane -L
      bind -n M-l select-pane -R
      bind -n M-k select-pane -U
      bind -n M-j select-pane -D

      bind -n M-\[ previous-window
      bind -n M-\] next-window

      set -g mouse on
      set -g allow-rename off
    '';
  };
}
