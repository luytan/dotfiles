{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.rust-rover
    jetbrains.goland
    jetbrains.clion
    jetbrains.idea
    jetbrains-runner
    jetbrains.pycharm
    jetbrains.webstorm
  ];
  home.file.".config/JetBrains/RustRover2025.3/rustrover64.vmoptions".text = "-Dawt.toolkit.name=WLToolkit";
  home.file.".config/JetBrains/GoLand2025.3/goland64.vmoptions".text = "-Dawt.toolkit.name=WLToolkit";
  home.file.".config/JetBrains/CLion2025.3/clion64.vmoptions".text = "-Dawt.toolkit.name=WLToolkit";
  home.file.".config/JetBrains/IntelliJIdea2025.3/idea64.vmoptions".text = "-Dawt.toolkit.name=WLToolkit";
  home.file.".config/JetBrains/PyCharm2025.3/pycharm64.vmoptions".text = "-Dawt.toolkit.name=WLToolkit";
  home.file.".config/JetBrains/WebStorm2025.3/webstorm64.vmoptions".text = "-Dawt.toolkit.name=WLToolkit";

}
