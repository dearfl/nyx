_: {
  config = {
    # Enable sound.
    services.pipewire = {
      enable = true;
      alsa.enable = true;
    };
  };
}
