{ pkgs, ... }:
{
  programs.nix-ld.enable = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  environment.systemPackages = with pkgs; [
    vim
    wget
    virt-what
    tpm2-tss
    linux-firmware
    libimobiledevice
  ];
}
