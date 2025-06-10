{
  config,
  ...
}:
{
  programs.beets = {
    enable = true;
    settings = {

      directory = "${config.xdg.userDirs.music}/Collection";
      library = "${config.xdg.userDirs.music}/Collection/library.db";
      plugins = [
        "edit"
        "fromfilename"
        "convert"
        "fetchart"
        "embedart"
        "mbsync"
        "replaygain"
      ];
      asciify_paths = true;

      edit = {
        itemfields = [
          "track"
          "title"
          "artist"
          "album"
          "albumartist"
        ];
      };

      convert = {
        auto_keep = true;
        embed = true;
        album_art_maxwidth = 500;
        never_convert_lossy_files = true;
        quiet = true;
        dest = "${config.xdg.userDirs.music}/Collection_MP3";
      };

      import = {
        languages = "en";
        duplicate_action = "skip";
        move = true;
        set_fields = {
          day = "%if{$orginal_day, $original_day, $day}";
          month = "%if{$orginal_month, $orginal_month, $month}";
          year = "%if{$orginal_year, $orginal_year, $year}";
        };
      };

      replaygain = {
        backend = "ffmpeg";
        overwrite = true;
      };

      paths = {
        default = "$albumartist/[$original_year] $album%aunique{}/$track - $title";
        comp = "Compilations/[$original_year] $album%aunique{}/$track - $title";
      };

      fetchart = {
        maxwidth = 1500;
        cover_format = "JPEG";
      };
    };
  };
}
