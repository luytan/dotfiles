{ ... }:
{
  services.printing.enable = true;
  services.flatpak.enable = true;
  services.libinput.enable = true;
  services.tailscale.enable = true;
  programs.firejail.enable = true;
  services.fwupd.enable = true;

  # OOM Handling
  services.earlyoom.enable = true;

  # Security & Auditing
  security.auditd.enable = true;
  security.polkit.enable = true;

  # AppArmor
  # security.apparmor.enable = true;

  # Yubikey
  services.pcscd.enable = true;
}
