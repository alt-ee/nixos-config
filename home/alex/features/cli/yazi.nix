{ ... }:
{
  programs.yazi = {
    enable = true;
    theme = {
      status = {
        sep_left.open = "";
        sep_left.close = "";
        sep_right.open = "";
        sep_right.close = "";
      };
      tabs = {
        sep_inner.open = "";
        sep_inner.close = "";
        sep_outer.open = "";
        sep_outer.close = "";
      };
      icon = {
        globs = [ ];
        dirs = [ ];
        files = [ ];
        exts = [ ];
        conds = [ ];
      };
    };
  };
}
