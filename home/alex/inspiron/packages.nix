{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  home.packages = (
    with pkgs;
    [
      audacity
      beets
      buckets
      calibre
      cardinal
      cmus
      ffmpeg
      gimp
      imagemagick
      libreoffice
      lutris
      man-pages
      newsboat
      nicotine-plus
      plugdata
      protonvpn-gui
      puredata
      qbittorrent
      renoise
      supercollider-with-sc3-plugins
      unzip
      uxn
      uxn.projects
      vault-tasks
      vlc
      winetricks
      wineWowPackages.stable
      xclip
      xsel
      yabridge
      yabridgectl
    ]
  );

  # ++

  #   (with pkgs-unstable; [
  #   ]);
}
