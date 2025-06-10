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
      unbind-key -a
      bind-key r source-file ${config.xdg.configHome}/tmux/tmux.conf
    '';
  };
}
