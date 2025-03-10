{
  config,
  ...
}:
{
  home.shellAliases = {
    cdot = "cd ${config.dotfiles}";
    cnix = "cd ${config.nixfiles}";
    switchhome = "cnix && home-manager switch --flake .#alex@nix-os";
    switchnix = "cnix && sudo nixos-rebuild switch --flake .#nix-os";

    t = "todo.sh";
  };

  home.sessionVariables = {
    TERMINAL = "wezterm";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      stty -ixon
    '';
  };

  programs.readline = {
    enable = true;
    variables = {
      show-all-if-ambiguous = true;
      completion-ignore-case = true;
      menu-complete-display-prefix = true;
      colored-completion-prefix = true;
    };
    extraConfig = ''
      TAB: menu-complete
    '';
  };
}
