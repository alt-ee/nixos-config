{
  pkgs,
  ...
}:
{
  imports = [
    ./zathura.nix
    ./wezterm.nix
  ];

  home.packages = (
    with pkgs;
    [
      keepassxc
    ]
  );

  services = {
    ssh-agent.enable = true;
    syncthing.enable = true;
  };

}
