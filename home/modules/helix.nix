{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {

      editor = {
        line-number = "relative";
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        lsp.display-messages = true;
        file-picker.hidden = false;
        indent-guides.render = true;
        statusline = {
          left = [
            "mode"
            "spinner"
            "file-name"
            "file-modification-indicator"
          ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
          ];
        };
        text-width = 80;
        soft-wrap = {
          enable = false;
          wrap-at-text-width = true;
          wrap-indicator = "↪ ";
        };
        bufferline = "multiple";
      };

      keys.normal = {
        space.f = "file_picker";
        space.b = "buffer_picker";
        space.q = ":quit";
        space.w = ":write";
      };
    };

    languages = {
      language-server = {
        rust-analyzer = {
          command = "rust-analyzer";
          config.check.command = "clippy";
        };
        nil = {
          command = "nil";
        };
        jedi-language-server = {
          command = "jedi-language-server";
        };
      };

      language = [
        {
          name = "rust";
          auto-format = true;
        }
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
          };
        }
        {
          name = "json";
          auto-format = true;
        }
        {
          name = "toml";
          auto-format = true;
        }
        {
          name = "markdown";
          auto-format = true;
          soft-wrap.enable = true;
        }
        {
          name = "python";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      nil
      rust-analyzer
      python313Packages.jedi-language-server

      nixfmt
      prettierd
    ];
  };
}
