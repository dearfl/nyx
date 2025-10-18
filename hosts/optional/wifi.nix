_: {
  config = {
    # wifi with wpa_supplicant
    networking.wireless = {
      enable = true;
      networks."glwifi-5g" = {
        # hashed password, should be safe?
        pskRaw = "513ce170f82b9f9bba9a5a9ddc5db9a62a26903dc9eaed7e9059502c6169440a";
        priority = 1000;
      };
    };
  };
}
