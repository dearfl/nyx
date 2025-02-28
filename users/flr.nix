_: {
  config = {
    users.users.flr = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      packages = [ ];
    };
  };
}
