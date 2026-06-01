{
  pkgs,
  pkgs-local,
  lib,
  ...
}:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
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

      keys.normal = {

        C-y = [
          ":sh rm -f /tmp/unique-file"
          ":insert-output yazi %{buffer_name} --chooser-file=/tmp/unique-file"
          ":insert-output echo '\x1b[?1049h\x1b[?2004h' > /dev/tty"
          ":open %sh{cat /tmp/unique-file}"
          ":redraw"
        ];
      };
      keys.insert = {
        C-c = "normal_mode";
      };
    };
    languages = {
      language-server.sclang-lint-server = with pkgs-local; {
        command = "${sclang-lint}/bin/sclang-lint-server";
      };
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
        {
          name = "supercollider";
          file-types = [
            "sc"
          ];
          language-servers = [
            "sclang-lint-server"
          ];
        }
      ];
    };
    extraPackages = (
      with pkgs;
      [
        marksman
        clang-tools
        nil
        lua-language-server
        texlab
        xsel
      ]
    );
  };
}
