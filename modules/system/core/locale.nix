{ lib, pkgs, ... }:
{
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = lib.mkDefault "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
    keyMap = "us";
    earlySetup = true;
  };
  systemd.services.systemd-vconsole-setup.unitConfig.After = "local-fs.target";
}
