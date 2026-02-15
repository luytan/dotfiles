{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    #inputs.niri.homeModules.niri
    ./noctalia.nix
  ];
  programs.niri = {
    #enable = true;
    #package = pkgs.niri-stable;
    settings = {
      #spawn-at-startup = [
      #  {
      #    argv = [
      #      "qs"
      #      "-c"
      #      "noctalia-shell"
      #    ];
      #  }
      #];
      window-rules = [
        {
          geometry-corner-radius = {
            top-left = 20.0;
            top-right = 20.0;
            bottom-left = 20.0;
            bottom-right = 20.0;
          };
          clip-to-geometry = true;
        }
      ];
      layer-rules = [
        {
          matches = [
            { namespace = "^noctalia-overview.*"; }
          ];
          place-within-backdrop = true;
        }
      ];
      debug = {
        honor-xdg-activation-with-invalid-serial = [ ];
      };
    };
  };
}
