_: {
  config = {
    # wifi with wpa_supplicant
    networking.wireless = {
      enable = true;
      # hashed password should be safe?
      networks."dearfl" = {
        pskRaw = "9b012899d5d7c6f3f43f85f3c26b4386b34231977f2fb21e0a5c096662b6831a";
        priority = 10000;
      };
      networks."glwifi-5g" = {
        pskRaw = "513ce170f82b9f9bba9a5a9ddc5db9a62a26903dc9eaed7e9059502c6169440a";
        priority = 1000;
      };
    };
  };
}
