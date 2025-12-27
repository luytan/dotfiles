{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Bootloader & Kernel
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.enable = true;

  # Plymouth
  boot.plymouth = {
    enable = true;
    theme = "bgrt";
  };

  hardware.enableAllFirmware = true;

  hardware.cpu.amd.updateMicrocode = true;

  # Networking & Time
  time.timeZone = "Europe/Paris";

  # i18n & Console
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = lib.mkDefault "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
    keyMap = "us";
    earlySetup = true;
  };
  systemd.services.systemd-vconsole-setup.unitConfig.After = "local-fs.target";

  # Nix Settings
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  # Services
  services.printing.enable = true;
  services.flatpak.enable = true;
  services.libinput.enable = true;
  services.tailscale.enable = true;

  # Programs
  programs.nix-ld.enable = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Common System Packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    virt-what
    tpm2-tss
    linux-firmware
    libimobiledevice
  ];
}
