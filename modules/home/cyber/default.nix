{ pkgs, ... }:

{
  home.packages = with pkgs; [
    arping
    binwalk
    dnsenum
    enum4linux-ng
    hashcat
    john
    sqlmap
    tcpdump
    wireshark
    wavemon
    nmap
    ghidra-bin
    burpsuite
  ];
}
