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
      vlc
      yabridge
      yabridgectl
    ])

    ++

      (with pkgs-unstable; [
        godot_4_3
        bitwig-studio
        vintagestory
      ]);
}
