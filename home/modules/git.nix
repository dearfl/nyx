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
          "git@github.com:" = {
            insteadOf = [
              "gh:"
              "github:"
              "https://github.com"
            ];
          };
        };
      };
    };
  };
}
