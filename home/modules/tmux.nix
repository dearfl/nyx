{ pkgs, lib, ... }:
{
  config = {
    programs.tmux = {
      enable = true;
      shell = lib.getExe pkgs.fish;
      baseIndex = 1;
      keyMode = "vi";
      prefix = "C-a";
    };
  };
}
