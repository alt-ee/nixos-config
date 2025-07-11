{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = inputs.helix.packages."${pkgs.system}".helix;
    settings = {
      theme = "base16_transparent";
      editor = {
        line-number = "relative";
        text-width = 120;
        mouse = false;

        auto-save.focus-lost = true;

        soft-wrap = {
          enable = true;
          max-wrap = 25;
          wrap-at-text-width = true;
        };

        cursor-shape = {
          normal = "block";
          insert = "bar";
        };
      };

      keys.insert = {
        C-c = "normal_mode";
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
        }
        {
          name = "lua";
          file-types = [
            "lua"
            "p8"
          ];
        }
        {
          name = "markdown";
          language-servers = [
            "marksman"
          ];
        }
      ];
    };
    extraPackages = with pkgs; [
      marksman
      clang-tools
      nil
      lua-language-server
      texlab
      xsel
    ];
  };
}
