_: {
  config = {
    programs.qutebrowser = {
      enable = true;
      quickmarks = {
        gh = "https://github.com";
        flr = "https://flr.me";
        gb = "https://godbolt.org";
        tr = "https://github.com/trending/rust?since=daily";
      };
      searchEngines = {
        DEFAULT = "https://google.com/search?q={}";
        y = "https://youtube.com/results?search_query={}";
        w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
        aw = "https://wiki.archlinux.org/?search={}";
        nw = "https://wiki.nixos.org/index.php?search={}";
        g = "https://www.google.com/search?hl=en&q={}";
        r = "https://doc.rust-lang.org/stable/std/?search={}";
        c = "https://en.cppreference.com/w/cpp/keyword/{}";
        gh = "https://github.com/search/?q={}";
        rc = "https://crates.io/search/?q={}";
        rd = "https://docs.rs/releases/search?query={}";
      };
      settings = {
        tabs.position = "bottom";
        content.geolocation = false;
        confirm_quit = [ "downloads" ];
        downloads = {
          location = {
            suggestion = "filename";
            directory = "/home/flr/res/downloads";
          };
          position = "bottom";
          remove_finished = 8000;
        };
        colors = {
          hints = {
            fg = "#EFF0EB";
            bg = "#1E1F29";
            match.fg = "#5AF78E";
          };
          webpage = {
            darkmode.enabled = true;
            preferred_color_scheme = "dark";
          };
        };
      };
    };
  };
}
