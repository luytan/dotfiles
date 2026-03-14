{pkgs, config, inputs, ...}:
let
  inherit (inputs.niri-scratchpad-flake.packages.${pkgs.stdenv.hostPlatform.system}) niri-scratchpad;
in
{
  home.packages = [ niri-scratchpad ];
}

