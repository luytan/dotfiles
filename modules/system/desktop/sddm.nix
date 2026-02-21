{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      compositor = "kwin";
      enable = true;
    };
    theme = "catppuccin-mocha-mauve";
  };
  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      accent = "mauve";
    })
  ];
}
