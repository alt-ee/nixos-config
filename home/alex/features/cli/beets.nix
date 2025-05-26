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
        "mbsync"
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
          day = "$orginal_day";
          month = "$orginal_month";
          year = "$orginal_year";
        };
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
