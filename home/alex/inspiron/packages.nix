{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  home.packages =
    (with pkgs; [
      audacity
      beets
      calibre
      cmus
      ffmpeg
      gimp
      imagemagick
      libreoffice
      man-pages
      newsboat
      nicotine-plus
      puredata
      supercollider
      unzip
      uxn
      vault-tasks
      vlc
      winetricks
      wineWowPackages.stable
      xclip
      xsel

      (writeShellScriptBin "nix-jack" ''
        exec /usr/bin/env \
          LD_LIBRARY_PATH=${pipewire.jack}/lib''${LD_LIBRARY_PATH:+:''${LD_LIBRARY_PATH}} \
          "''$@"
      '')
    ])

    ++

      (with pkgs-unstable; [
        renoise
      ]);
}
