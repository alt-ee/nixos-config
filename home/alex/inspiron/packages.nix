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
      rclone
      renoise
      supercollider
      tytools
      unzip
      vlc
      w3m
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
