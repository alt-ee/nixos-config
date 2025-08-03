{
  pkgs,
  ...
}:
{
  home.packages = (
    with pkgs;
    [
      (reaper.overrideAttrs (
        finalAttrs: previousAttrs: {
          installPhase =
            if stdenv.hostPlatform.isDarwin then
              ''
                runHook preInstall
                mkdir -p "$out/Applications/Reaper.app"
                cp -r * "$out/Applications/Reaper.app/"
                makeWrapper "$out/Applications/Reaper.app/Contents/MacOS/REAPER" "$out/bin/reaper"
                runHook postInstall
              ''
            else
              ''
                runHook preInstall

                HOME="$out/share" XDG_DATA_HOME="$out/share" ./install-reaper.sh \
                  --install $out/opt \
                  --integrate-user-desktop
                rm $out/opt/REAPER/uninstall-reaper.sh

                # Dynamic loading of plugin dependencies does not adhere to rpath of
                # reaper executable that gets modified with runtimeDependencies.
                # Patching each plugin with DT_NEEDED is cumbersome and requires
                # hardcoding of API versions of each dependency.
                # Setting the rpath of the plugin shared object files does not
                # seem to have an effect for some plugins.
                # We opt for wrapping the executable with LD_LIBRARY_PATH prefix.
                # Note that libcurl and libxml2 are needed for ReaPack to run.
                wrapProgram $out/opt/REAPER/reaper \
                  --prefix LD_LIBRARY_PATH : "${
                    lib.makeLibraryPath [
                      curl
                      lame
                      libxml2
                      ffmpeg
                      vlc
                      xdotool
                      gtk3
                      stdenv.cc.cc
                    ]
                  }"

                mkdir $out/bin
                ln -s $out/opt/REAPER/reaper $out/bin/

                runHook postInstall
              '';
        }
      ))
    ]
  );
}
