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
      distrho-ports
      emacs
      ffmpeg
      gimp
      imagemagick
      keepassxc
      libreoffice
      man-pages
      nicotine-plus
      syncthing
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
        keepmenu
        renoise
        todo-txt-cli
      ]);
}
