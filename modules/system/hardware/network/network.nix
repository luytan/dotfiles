{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.hardware.network;
in
{
  config = lib.mkIf cfg.network {
    networking.networkmanager = {
      enable = true;
      wifi.macAddress = "random";
    };

    networking.nameservers = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];

    services.resolved = {
      enable = true;
      settings = {
        Resolve = {
          DNSSEC = true;
          DNSOverTLS = "opportunistic";
          Domains = [ "~." ];
          FallbackDNS = [
            "1.1.1.1#one.one.one.one"
            "1.0.0.1#one.one.one.one"
          ];
        };
      };
    };
    networking.firewall = {
      enable = true;
      backend = "firewalld";
      checkReversePath = "loose";
    };

    services.firewalld = {
      enable = true;
      package = pkgs.firewalld-gui;
    };
    networking.nftables.enable = true;
    services.tailscale.enable = true;
  };
}
