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
      calibre
      cardinal
      cmus
      distrho-ports
      ffmpeg
      gimp
      imagemagick
      itgmania
      libreoffice
      lutris
      m8c
      man-pages
      mpv
      nicotine-plus
      plugdata
      protonvpn-gui
      puredata
      qbittorrent
      renoise
      supercollider-with-sc3-plugins
      tytools
      unzip
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
