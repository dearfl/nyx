{ config, ... }:
let
  mkRule = user: {
    users = [ user ];
    keepEnv = true;
    persist = true;
    setEnv = [
      "SUDO_UID=${toString config.users.users.${user}.uid}"
      "-HOME"
      "-GTK_PATH"
      "-INFOPATH"
      "-LIBEXEC_PATH"
      "-LOGNAME"
      "-PWD"
      "-NIX_USER_PROFILE_DIR"
      "-NIX_XDG_DESKTOP_PORTAL_DIR"
      "-QTWEBKIT_PLUGIN_PATH"
      "-TERMINFO_DIRS"
      "-USER"
      "-XCURSOR_PATH"
      "-XDG_CACHE_HOME"
      "-XDG_CONFIG_DIRS"
      "-XDG_CONFIG_HOME"
      "-XDG_DATA_HOME"
      "-XDG_STATE_HOME"
    ];
  };
in
{
  config = {
    security.sudo.enable = false;
    security.doas = {
      enable = true;
      extraRules = map mkRule [ "flr" ];
    };
  };
}
