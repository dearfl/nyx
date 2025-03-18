_: {
  config = {
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          "Noto Serif"
          "Noto Serif CJK SC"
          "Noto Serif CJK TC"
          "Noto Serif CJK JP"
          "Noto Serif CJK KR"
        ];
        sansSerif = [
          "Noto Sans"
          "Noto Sans CJK SC"
          "Noto Sans CJK TC"
          "Noto Sans CJK JP"
          "Noto Sans CJK KR"
        ];
        monospace = [
          "Noto Mono"
          "Sarasa Term SC"
          "Sarasa Term TC"
          "Sarasa Term J"
        ];
        emoji = [
          "Noto Color Emoji"
          "Noto Emoji"
        ];
      };
    };
  };
}
