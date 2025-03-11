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
  ];

  home.packages = (
    with pkgs;
    [
      fzf

      ripgrep
    ]
  );

  programs = {
    zellij.enable = true;
    lazygit.enable = true;
    git.enable = true;
    zoxide.enable = true;
  };
}
