{ ... }:
{
  imports = [
    ./boot.nix
    ./locale.nix
    ./nix.nix
    ./services.nix
    ./pkg.nix
  ];
  users.users.root.hashedPassword = "!";
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}
