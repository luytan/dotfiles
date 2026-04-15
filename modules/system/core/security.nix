{ ... }:
{
  security.rtkit.enable = true;

  # Security
  security.polkit.enable = true;
  security.soteria.enable = true;
  security.apparmor.enable = true;

  security.sudo-rs = {
    enable = true;
    execWheelOnly = true;
  };
}
