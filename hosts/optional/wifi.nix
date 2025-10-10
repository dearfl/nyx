_: {
  config = {
    # wifi with wpa_supplicant
    networking.wireless = {
      enable = true;
      # hashed password, should be safe?
      networks = {
        "glwifi-5g" = {
          pskRaw = "513ce170f82b9f9bba9a5a9ddc5db9a62a26903dc9eaed7e9059502c6169440a";
          priority = 1000;
        };
        "DWTX" = {
          pskRaw = "beafe4e57d20dde127d6bc4f761d922c5d256a5dd5d84f72e832451934cc0e84";
          priority = 100;
        };
        "GL-1" = {
          pskRaw = "62a3c2fb880cd885672fb68234109abecbea4fbcfc9b2e297856d9e0d86ce39e";
          priority = 100;
        };

      };
    };
  };
}
