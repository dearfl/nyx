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
        };
      };
    };
  };
}
