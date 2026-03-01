{ inputs, pkgs, ... }:
{
  imports = [ inputs.silentSDDM.nixosModules.default ];
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      compositor = "kwin";
      enable = true;
    };
    #theme = "catppuccin-mocha-mauve";
  };
  programs.silentSDDM = {
    enable = true;
    theme = "silvia";
    backgrounds = {
      nier = pkgs.fetchurl {
        name = "NierTitle3.jpg";
        url = "https://i.imgur.com/R0Qjwou.png";
        hash = "sha256-qchRpbp2RnsZVpoPe1dWugNIgYLwckMJdFO83M6tyyk=";
      };
    };
    settings = {
      "LoginScreen" = {
        background = "NierTitle3.jpg";
      };
      "LockScreen" = {
        background = "NierTitle3.jpg";
      };
    };
  };
  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      accent = "mauve";
    })
  ];
}
