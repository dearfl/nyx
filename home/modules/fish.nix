_: {
  config = {
    programs.fish = {
      enable = true;
      shellAbbrs = {
        gs = "git status";
        gc = "git checkout";
        gcl = "git clone";
        gm = "git commit";
      };
    };
  };
}
