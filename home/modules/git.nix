_: {
  config = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "dearfl";
          email = "i@flr.me";
        };
        alias = {
          count-lines = "! git log --author=\"$1\" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf \"added lines: %s, removed lines: %s, total lines: %s\\n\", add, subs, loc }' #";
          lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
          # `git log` with patches shown with difftastic.
          dl = "-c diff.external=difft log -p --ext-diff";
          # Show the most recent commit with difftastic.
          ds = "-c diff.external=difft show --ext-diff";
          # `git diff` with difftastic.
          dft = "-c diff.external=difft diff";
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
