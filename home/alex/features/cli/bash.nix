{ ... }:
{
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      initExtra = ''
        stty -ixon
      '';
    };

    readline = {
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
  };
}
