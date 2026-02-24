{ ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "rust"
      "material-icon-theme"
      "tokyo-night"
      "vue"
      "make"
    ];
    userSettings = {
      theme = {
        mode = "system";
        dark = "Tokyo Night Moon";
        light = "One Light";
      };
      telemetry = {
        diagnostics =  false;
        metrics = false;
      };
      hour_format = "hour24";
      icon_theme = "Material Icon Theme";
      vim_mode = false;
    };
  };
}
