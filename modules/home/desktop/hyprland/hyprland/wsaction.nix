{ config, pkgs, ... }:

let
  wsaction = pkgs.writeScriptBin "wsaction" ''
    #!${pkgs.fish}/bin/fish

    if test "$argv[1]" = '-g'
        set group
        set -e $argv[1]
    end

    if test (count $argv) -ne 2
        echo 'Wrong number of arguments. Usage: wsaction [-g] <dispatcher> <workspace>'
        exit 1
    end

    set -l active_ws (${pkgs.hyprland}/bin/hyprctl activeworkspace -j | ${pkgs.jq}/bin/jq -r '.id')

    if set -q group
        ${pkgs.hyprland}/bin/hyprctl dispatch $argv[1] (math "($argv[2] - 1) * 10 + $active_ws % 10")
    else
        ${pkgs.hyprland}/bin/hyprctl dispatch $argv[1] (math "floor(($active_ws - 1) / 10) * 10 + $argv[2]")
    end
  '';
in
{
  home.packages = [
    wsaction
  ];
  wayland.windowManager.hyprland.settings."$wsaction" = "${wsaction}/bin/wsaction";
}
