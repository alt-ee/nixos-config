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
      bespokesynth
      calibre
      distrho-ports
      emacs
      ffmpeg
      gimp
      imagemagick
      kdenlive
      libreoffice
      man-pages
      nicotine-plus
      reaper
      runelite
      tmux
      unzip
      vlc
      winetricks
      wineWowPackages.stable
      xclip
      xsel
      yabridge
      yabridgectl

      (lutris.override {
        extraPkgs = pkgs: [
          pango
        ];
      })
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
