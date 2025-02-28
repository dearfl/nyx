{ pkgs, ... }:
{
  # nix settings
  config = {
    nix = {
      # use stable nix
      package = pkgs.nixVersions.stable;
      settings = {
        # use flakes
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        # mirrors
        substituters = [
          "https://mirrors.ustc.edu.cn/nix-channels/store"
          "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        ];
        trusted-substituters = [
          "https://mirrors.ustc.edu.cn/nix-channels/store"
          "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        ];
      };
    };
  };
}
