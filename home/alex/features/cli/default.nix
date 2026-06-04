{
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./helix.nix
    ./yazi.nix
    ./bash.nix
    ./fish.nix
  ];

  home.packages = (
    with pkgs;
    [
      ripgrep
      tmux
    ]
  );

  home.shellAliases = {
    "h." = "hx .";
    "ncp" = "cd ${config.nixfiles} && hx home/$USER/$hostname/packages.nix";
    "lg" = "lazygit";
  };

  programs = {
    lazygit.enable = true;
    git.enable = true;
    zoxide.enable = true;
    nix-index.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
