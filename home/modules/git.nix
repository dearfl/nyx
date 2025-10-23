_: {
  config = {
    programs.git = {
      enable = true;
      difftastic = {
        enable = true;
      };
      settings = {
        user = {
          name = "dearfl";
          email = "i@flr.me";
        };
        aliases = {
          count-lines = "! git log --author=\"$1\" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf \"added lines: %s, removed lines: %s, total lines: %s\\n\", add, subs, loc }' #";
          lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        };
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
          "git@gitlab.com:" = {
            insteadOf = [
              "gl:"
              "gitlab:"
              "https://gitlab.com"
            ];
          };
        };
      };
    };
  };
}
