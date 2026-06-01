{
  pkgs ? import <nixpkgs> { },
  ...
}:

{
  sclang-lint = pkgs.callPackage ./sclang-lint { };
}
