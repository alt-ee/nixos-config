{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Alex";
    userEmail = "59831659+alt-ee@users.noreply.github.com";

    extraConfig = {
      init.defaultBranch = "main";
      fetch.prune = true;
    };
  };
}
