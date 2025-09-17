_: {
  config = {
    # wifi with wpa_supplicant
    networking.wireless = {
      enable = true;
      # hashed password, should be safe?
      networks = {
        "glwifi-5g".pskRaw = "513ce170f82b9f9bba9a5a9ddc5db9a62a26903dc9eaed7e9059502c6169440a";
        "WZKJ".pskRaw = "682fa633b86b1b6fadd82215a5a840cb55c85c59a9c4047d96408268adc31c31";
      };
    };
  };
}
