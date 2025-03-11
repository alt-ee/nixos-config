{
  ...
}:
{
  imports = [
    ./zathura.nix
    ./wezterm.nix
  ];

  services.ssh-agent.enable = true;
}
