{
  pkgs,
  ...

}:
{
  environment.systemPackages = with pkgs; [
    htop
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default
    wget
    git
  ];
}
