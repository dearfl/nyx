{ pkgs, ... }:
{
  config = {
    programs.tmux = {
      enable = true;
      shell = "${pkgs.fish}/bin/fish";
      baseIndex = 1;
      keyMode = "vi";
      prefix = "C-a";
    };
  };
}
