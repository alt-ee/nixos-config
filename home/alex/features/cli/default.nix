{
  pkgs,
  ...
}:
{
  imports = [
    ./helix.nix
    ./yazi.nix
    ./zk.nix
    ./bash.nix
    ./fish.nix
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
  };

  programs = {
    zellij.enable = true;
    lazygit.enable = true;
    git.enable = true;
    zoxide.enable = true;
  };
}
