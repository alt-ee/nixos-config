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
    "nc packages" = "cd ${config.nixfiles} && hx home/$user/$hostName/packages.nix";
  };

  programs = {
    zellij.enable = true;
    lazygit.enable = true;
    git.enable = true;
    zoxide.enable = true;
    nix-index.enable = true;
  };
}
