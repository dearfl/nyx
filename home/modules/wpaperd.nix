_: {
  config = {
    services = {
      # change random wallpaper every 5 minutes
      wpaperd = {
        enable = true;
        settings = {
          default = {
            duration = "5m";
            mode = "stretch";
            sorting = "random";
          };
          any = {
            path = "/home/flr/res/images/fav";
          };
        };
      };
    };
  };
}
