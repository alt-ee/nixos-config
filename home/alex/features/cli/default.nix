{
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./helix.nix
    ./yazi.nix
    ./zk.nix
    ./bash.nix
    ./fish.nix
    ./tmux.nix
  ];

  home.packages = (
    with pkgs;
    [
      fzf
      ripgrep
    ]
  );

  home.shellAliases = {
    "h." = "hx .";
    "ncp" = "cd ${config.nixfiles} && hx home/$USER/$hostname/packages.nix";
    "lg" = "lazygit";
  };

  programs = {
    zellij.enable = true;
    lazygit.enable = true;
    git.enable = true;
    zoxide.enable = true;
    nix-index.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
