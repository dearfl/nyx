_: {
  config = {
    users.users.flr = {
      hashedPassword = "$y$j9T$0nCTYi4BXgRzvzIZBzg9J/$oqy.ZZ86kaQ4WWAYFMFFqtQm8Qsf.lr3YVcCwCtopy4";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "input"
        "video"
        "audio"
        "users"
        "disk"
      ];
      packages = [ ];
      uid = 1000;
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDfbMpESW0rhUDAjc4V4aiSzNdH3Ogktbwi9/skPv3PEP2uQuLxd7t3VllfrMgjLoUNXoeJdSAkJ/SCJBHTg7MczW+l3XTcBSE3B4cHYpSQSbuNz8Z5NO11GeuWnNbZFsKBfRCIH+eKjzN3zGvnL5eweBme6jOAbqwFiynhYFG6Uxb5J8Suq7dlTVjX3mMxs2egfeVBaKT77RFjdosfIxW9/Olk/o3SWxrO42XrWsFqzbaq4Kzef2n+0/uUet1RSfXBv8rn/o5JZooSBkcyqVD3+9W22sVQff3eWnz4AXSKI5pdB6kCspYSgGMh9zlaRxvdHidcMCaCZ62vEApTFOwW2MVd+Xu4OcoP4oYudaKa+52Id8IkK7tEPXEWq1FbZml74aCtl9YLxZfY86UyzZhhpZKwErksOXacf5q0YGqvJSINei6C+DFY9zKpu3UAON+91VNvB/xn0Ql8L/con8Z8WpXGLzT+skL4CItBqyT+7mkWKrU06syvlCVanYeQ/fqtHfsC+t/zFjb2/+YLnCHgSdF/XKcJMNPGLwu6S3py7BlXLqyH3WH0dzFpx/NfCV5GzP3YjKtwgA6TwrdaLuzeJax9CNrz5oaAmsQ3mSvXluySMX/HVJv+EtZ3523IhB6w9tt0QTMyXP76aOWxTwEBKVHHNX2CwKcsBUcVJT9BsQ== i@flr.me"
      ];
    };
  };
}
