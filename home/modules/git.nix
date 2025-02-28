_: {
  config = {
    programs.git = {
      enable = true;
      userName = "dearfl";
      userEmail = "i@flr.me";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        url = {
          "https://github.com/" = {
            insteadOf = [
              "gh:"
              "github:"
            ];
          };
        };
      };
    };
  };
}
