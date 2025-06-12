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
      original_date = true;
      plugins = [
        "discogs"
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
        auto = true;
        embed = true;
        copy_album_art = true;
        album_art_maxwidth = 500;
        never_convert_lossy_files = true;
        quiet = true;
        command = "ffmpeg -i $source -y -vn -aq 0 $dest";
        extension = "mp3";
      };

      import = {
        languages = "en";
        duplicate_action = "skip";
        move = true;
      };

      replaygain = {
        backend = "ffmpeg";
        overwrite = true;
      };

      paths = {
        default = "$albumartist/[$year] $album%aunique{}/$track - $title";
        comp = "Compilations/[$year] $album%aunique{}/$track - $title";
      };

      fetchart = {
        maxwidth = 1500;
        cover_format = "JPEG";
      };
    };
  };
}
