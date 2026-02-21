{ ... }:
{
  users.users = {
    root = {
      hashedPassword = "!";
    };
    luytan = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "dialout"
        "libvirtd"
      ];
    };
  };
}
