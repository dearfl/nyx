_: {
  config = {
    i18n.defaultLocale = "en_US.UTF-8";
    # this should fix some issue caused by environment variable
    # differences between system and user programs
    # although we have other envvar to add like fcitx5-related ones
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
