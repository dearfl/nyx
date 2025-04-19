_: {
  config = {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      config = {
        global.strict_env = true;
        whitelist.prefix = [
          "/home/flr/dev/games"
          "/home/flr/dev/rust"
          "/home/flr/dev/nyx"
          "/home/flr/dev/python"
          "/home/flr/dev/blog"
          "/home/flr/dev/interview"
        ];
      };
    };
  };
}
