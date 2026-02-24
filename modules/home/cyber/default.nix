{
  pkgs,
  lib,
  osConfig ? { },
  ...
}:

let
  isWsl = osConfig.wsl.enable or false;
in
{
  home.packages =
    with pkgs;
    [
      arping
      binwalk
      dnsenum
      enum4linux-ng
      hashcat
      john
      sqlmap
      tcpdump
      wavemon
      nmap
    ]
    ++ lib.optionals (!isWsl) [
      wireshark
      ghidra-bin
      burpsuite
    ];
}
