{ ... }:
{
  services.printing.enable = true;
  services.flatpak.enable = true;
  services.libinput.enable = true;
  services.tailscale.enable = true;
  programs.firejail.enable = true;
  services.fwupd.enable = true;
  programs.dconf.enable = true;

  # OOM Handling
  services.earlyoom.enable = true;

  # Yubikey
  services.pcscd.enable = true;
}
