{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  home.packages =
    (with pkgs; [
      anki
      audacity
      beets
      bitwig-studio
      calibre
      cowsay
      distrho-ports
      emacs
      ffmpeg
      fzf
      geogebra
      gimp
      gparted
      imagemagick
      keepassxc
      libreoffice
      man-pages
      nb
      nicotine-plus
      octaveFull
      okular
      puredata
      python3
      qmmp
      ranger
      ripgrep
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
        wezterm
      ]);
}
