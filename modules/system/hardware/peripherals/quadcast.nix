{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.hardware.peripherals;

  quadcastrgb = pkgs.stdenv.mkDerivation rec {
    pname = "quadcastrgb";
    version = "git";

    src = pkgs.fetchgit {
      url = "https://github.com/Ors1mer/QuadcastRGB.git";
      sha256 = "WiQjtFk6UQ+xNzujaWasbGf+gZ98OM2dYzp9/bp1mks=";
    };

    nativeBuildInputs = [ pkgs.pkg-config ];
    buildInputs = [ pkgs.libusb1 ];

    buildPhase = ''
      make
    '';

    installPhase = ''
      mkdir -p $out/bin
      install -Dm755 quadcastrgb $out/bin/quadcastrgb
    '';
  };
in
{
  config = lib.mkIf cfg.quadcast {
    environment.systemPackages = [ quadcastrgb ];
    services.udev.extraRules = ''
      SUBSYSTEM=="usb", ATTR{idVendor}=="03f0", ATTR{idProduct}=="0f8b", TAG+="uaccess"
      SUBSYSTEM=="usb", ATTR{idVendor}=="03f0", ATTR{idProduct}=="0d8b", TAG+="uaccess"
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="0f8b", MODE="0660", GROUP="wheel"
    '';

    systemd.user.services.quadcastrgb = {
      description = "HyperX Quadcast RGB Wave";

      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];

      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${quadcastrgb}/bin/quadcastrgb wave";
        RemainAfterExit = true;
        KillMode = "process";
      };
    };
  };
}
