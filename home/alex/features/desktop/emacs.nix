{
  pkgs,
  lib,
  ...
}:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackages = (
      epkgs: [
        epkgs.treesit-grammars.with-all-grammars
        epkgs.pdf-tools
      ]
    );
  };
}
