{
  pkgs,
  ...
}:
{
  home.packages = (
    with pkgs;
    [
      kdenlive
      obs-studio
      reaper
      prismlauncher
    ]
  );
}
