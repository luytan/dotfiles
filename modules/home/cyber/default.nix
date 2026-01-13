{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wireshark
    wavemon
    nmap
    ghidra-bin
  ];
}
