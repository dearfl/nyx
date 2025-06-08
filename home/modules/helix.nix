_: {
  config = {
    programs.helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "gruvbox";
        editor = {
          line-number = "relative";
          lsp = {
            display-messages = true;
            display-inlay-hints = true;
          };
        };
        keys.normal = {
          space.space = "file_picker";
          space.w = ":w";
          space.q = ":q";
          esc = [
            "collapse_selection"
            "keep_primary_selection"
          ];
        };
      };
      ignores = [
        "target"
        "!.gitignore"
        "!.gitattributes"
        "!.github/"
        "!.gitlab/"
        "!.cargo/"
      ];
      languages = {
        language = [
          {
            name = "python";
            scope = "source.python";
            injection-regex = "python";
            file-types = [
              "py"
              "pyi"
              "py3"
              "pyw"
              ".pythonstartup"
              ".pythonrc"
            ];
            shebangs = [ "python" ];
            roots = [
              "."
              "pyproject.toml"
              "pyrightconfig.json"
            ];
            comment-token = "#";
            language-servers = [
              "pyright"
              "ruff"
            ];
            indent = {
              tab-width = 4;
              unit = "    ";
            };
            auto-format = true;
            formatter = {
              command = "black";
              args = [
                "-"
                "--quiet"
                "--line-length=80"
              ];
            };
          }
          {
            name = "nix";
            auto-format = true;
            formatter.command = "nixfmt";
          }
        ];
        language-server = {
          rust-analyzer.config = {
            checkOnSave.command = "clippy";
            cargo.allFeatures = true;
            inlayHints = {
              bindingModeHints.enable = true;
              closingBraceHints.minLines = 10;
              closureReturnTypeHints.enable = "with_block";
              discriminantHints.enable = "fieldless";
              lifetimeElisionHints.enable = "skip_trivial";
              typeHints.hideClosureInitialization = false;
            };
          };
          pylsp.config.pylsp.plugins = {
            ruff.enabled = true;
            black.enabled = true;
          };
          pyright = {
            command = "basedpyright-langserver";
            args = [ "--stdio" ];
            config = {
              reportMissingTypeStubs = false;
              python.analysis = {
                typeCheckingMode = "basic";
                autoImportCompletions = true;
              };
            };
          };
          ruff = {
            command = "ruff";
            config.settings.args = [ ];
          };
        };
      };
    };
  };
}
