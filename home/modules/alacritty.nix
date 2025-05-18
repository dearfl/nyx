_: {
  config = {
    programs.alacritty = {
      enable = true;
      settings = {
        terminal.shell = "fish";
        # this font have no korean or japanese variant?
        font.normal.family = "FiraCode Nerd Font Mono";
      };
    };
  };
}
