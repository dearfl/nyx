_: {
  config = {
    nix.settings = {
      # mirrors
      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store"
      ];
      trusted-substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store"
      ];
    };
  };
}
