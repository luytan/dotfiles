{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.rust-rover
    jetbrains.goland
    jetbrains.clion
    jetbrains-runner
  ];
  home.file.".config/JetBrains/RustRover2025.3/rustrover64.vmoptions".text =
    "-Dawt.toolkit.name=WLToolkit";
  home.file.".config/JetBrains/GoLand2025.3/goland64.vmoptions".text = "-Dawt.toolkit.name=WLToolkit";
  home.file.".config/JetBrains/CLion2025.3/clion64.vmoptions".text = "-Dawt.toolkit.name=WLToolkit";
}
