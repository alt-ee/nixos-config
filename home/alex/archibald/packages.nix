{
  pkgs,
  pkgs-unstable,
  ...
}:

{
  home.packages =
    (with pkgs; [
      bespokesynth
      bolt-launcher
      bottles
      bitwig-studio4
      cardinal
      clonehero
      discord
      distrho-ports
      ffmpeg
      fooyin
      gamemode
      imagemagick
      kdePackages.kdenlive
      lutris
      nicotine-plus
      obs-studio
      octave
      kdePackages.okular
      plugdata
      prismlauncher
      protonvpn-gui
      qbittorrent
      renoise
      runelite
      supercollider
      unrar
      vcv-rack
      vlc
      yabridge
      yabridgectl
    ])

    ++

      (with pkgs-unstable; [
        godot_4_3
        vintagestory
      ]);
}
