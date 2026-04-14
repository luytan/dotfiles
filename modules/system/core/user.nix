{ user, ... }:
{
  users.users = {
    root = {
      hashedPassword = "!";
    };
    ${user} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "dialout"
        "libvirtd"
        "i2c"
      ];
    };
  };
}
