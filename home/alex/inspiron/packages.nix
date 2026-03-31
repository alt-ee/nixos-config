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
      bolt-launcher
      buckets
      calibre
      cardinal
      cmus
      ffmpeg
      gimp
      imagemagick
      itgmania
      libreoffice
      lutris
      m8c
      man-pages
      mpv
      newsboat
      nicotine-plus
      plugdata
      protonvpn-gui
      projectm_3
      puredata
      qbittorrent
      renoise
      runelite
      supercollider-with-sc3-plugins
      tytools
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
