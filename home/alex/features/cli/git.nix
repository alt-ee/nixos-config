{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Alex";
      user.email = "59831659+alt-ee@users.noreply.github.com";
      init.defaultBranch = "main";
      fetch.prune = true;
    };
  };
}
