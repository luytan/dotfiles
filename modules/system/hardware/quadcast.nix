{ config, pkgs, ... }:

let
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
  environment.systemPackages = [ quadcastrgb ];
}