{
  pkgs,
  ...
}:
{
  imports = [
    ./zathura.nix
    # ./wezterm.nix
  ];

  home.packages = (
    with pkgs;
    [
      keepassxc
      obsidian
      wezterm
    ]
  );

  services = {
    ssh-agent.enable = true;
    syncthing.enable = true;
  };

}
